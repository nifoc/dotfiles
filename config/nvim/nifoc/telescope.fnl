(let [mod {}
      builtin (require :telescope.builtin)
      themes (require :telescope.themes)]
  (fn mod.find-files []
    (let [find-opts (themes.get_ivy {:find_command [:rg
                                                    :--files
                                                    :--hidden
                                                    :--ignore-vcs
                                                    :-L
                                                    :-g
                                                    :!.git/*
                                                    :-g
                                                    :!node_modules/*]})]
      (builtin.find_files find-opts)))

  (fn mod.project-files []
    (let [git-opts (themes.get_ivy)
          ok? (pcall builtin.git_files git-opts)]
      (when (not ok?)
        (mod.find-files))))

  mod)

