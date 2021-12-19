local lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local illuminate = require('illuminate')
local diagnostic_utils = require('nifoc.utils.diagnostic')

local function custom_attach(client, bufnr)
  -- Plugin attachments
  lsp_status.on_attach(client)

  if client.resolved_capabilities.document_highlight then
    illuminate.on_attach(client)
  end

  diagnostic_utils.maybe_enable_lsp(client, bufnr)
  diagnostic_utils.maybe_enable_fixer(client, bufnr)
end

local function custom_attach_no_format(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  custom_attach(client, bufnr)
end

-- Setup
lsp_status.config({
  current_function = true,
  show_filename = false,
  diagnostics = false,
})

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
  'bashls',
  'cssls',
  'dockerls',
  'eslint',
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
