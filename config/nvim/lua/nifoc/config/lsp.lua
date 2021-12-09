local lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local illuminate = require('illuminate')
local keymap = require('nifoc.keymap')

local function enable_lsp_fixer(_)
  vim.cmd [[
    augroup nifoc_lsp_formatting
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
    augroup end
  ]]
end

local function custom_attach(client, bufnr)
  -- Plugin attachments
  lsp_status.on_attach(client)
  keymap.lsp_attach(client, bufnr)

  if client.resolved_capabilities.document_highlight then
    illuminate.on_attach(client)
  end

  if vim.b.nifoc_lsp_enabled == nil then
    vim.api.nvim_buf_set_var(bufnr, 'nifoc_lsp_enabled', 1)
    vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
  end

  if client.resolved_capabilities.document_formatting and vim.b.nifoc_fixer_enabled == nil then
    vim.api.nvim_buf_set_var(bufnr, 'nifoc_fixer_enabled', 1)

    enable_lsp_fixer(client)
  end

  vim.api.nvim_command('doautocmd <nomodeline> User NifocLspAttached')
end

local function custom_attach_no_format(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  custom_attach(client, bufnr)
end

-- Setup

vim.cmd('sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = '■ ',
      spacing = 4,
    },
    signs = false,
    update_in_insert = false,
  }
)

lsp_status.register_progress()

-- Default configuration

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 700,
}

local default_config = {
  on_attach = custom_attach,
  capabilities = capabilities,
  flags = flags,
}

local default_servers = {
  'angularls',
  'bashls',
  'cssls',
  'dockerls',
  'html',
  'rnix',
  'sqls',
  'taplo',
  'yamlls'
}

for _, name in ipairs(default_servers) do
  lsp[name].setup(default_config)
end

-- Default configuration without formatting

local default_servers_no_formatting = {}

for _, name in ipairs(default_servers_no_formatting) do
  lsp[name].setup(vim.tbl_extend('force', default_config, {
    on_attach = custom_attach_no_format,
  }))
end

-- Custom configuration

lsp.elixirls.setup(vim.tbl_extend('force', default_config, {
  cmd = { 'elixir-ls' },
}))

lsp.tsserver.setup(vim.tbl_extend('force', default_config, {
  cmd = { 'typescript-language-server', '--stdio', '--tsserver-path', 'tsserver'},
  on_attach = custom_attach_no_format,
}))

lsp.jsonls.setup(vim.tbl_extend('force', default_config, {
  cmd = { 'vscode-json-language-server', '--stdio' },
}))

lsp.solargraph.setup(vim.tbl_extend('force', default_config, {
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
}))

lsp.sumneko_lua.setup(vim.tbl_extend('force', default_config, {
  cmd = {
    vim.fn.globpath('~', 'Code/LSP/lua/bin/macOS/lua-language-server'),
    '-E',
    vim.fn.globpath('~', 'Code/LSP/lua/main.lua')
  },
  root_dir =  lsp.util.root_pattern("init.vim", "init.lua", ".git") or vim.loop.os_homedir(),
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim', 'use'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {enable = false},
    },
  },
}))

-- Try to start efm as the last language server

lsp.efm.setup(vim.tbl_extend('force', default_config, {
  cmd = {
    'efm-langserver',
    '-c',
    vim.fn.globpath('~', '.config/nvim/efm.yml'),
  },
  filetypes = {
    'dockerfile',
    'elixir',
    'fish',
    'javascript',
    'sh',
  },
  on_attach = function(client, bufnr)
    local disable_formatter_ft = { 'dockerfile', 'elixir' }
    local slow_ft = {}

    if vim.tbl_contains(disable_formatter_ft, vim.bo.filetype) then
      client.resolved_capabilities.document_formatting = false
    end

    if vim.tbl_contains(slow_ft, vim.bo.filetype) then
      client.resolved_capabilities.text_document_did_change = vim.lsp.protocol.TextDocumentSyncKind.None
    end

    client.resolved_capabilities.document_symbol = false
    client.resolved_capabilities.workspace_symbol = false

    custom_attach(client, bufnr)
  end,
}))
