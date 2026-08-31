(let [treesitter (require :nvim-treesitter)]
  (treesitter.setup {:install_dir _G.nvim_treesitter_parser_directory}))
