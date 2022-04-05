(let [project (require :project_nvim)]
  (project.setup {:detection_methods [:pattern :lsp]
                  :patterns [:.git
                             :_darcs
                             :.hg
                             :.bzr
                             :.svn
                             :.gitlab-ci.yml
                             :flake.nix
                             :init.lua
                             :Makefile
                             :mix.exs
                             :package.json]}))
