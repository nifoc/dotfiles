require('project_nvim').setup {
  detection_methods = { "pattern", "lsp" },

  patterns = {
    ".git",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    ".gitlab-ci.yml",
    "flake.nix",
    "init.lua",
    "Makefile",
    "mix.exs",
    "package.json",
  },
}
