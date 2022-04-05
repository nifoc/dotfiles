(let [mod {}
      builtin (require :telescope.builtin)
      themes (require :telescope.themes)]
  (fn mod.project-files []
    (let [git-opts (themes.get_ivy)
          find-opts (themes.get_ivy {:find_command [:rg
                                                    :--files
                                                    :--hidden
                                                    :-L
                                                    :-g
                                                    :!.git/*]})
          ok? (pcall builtin.git_files git-opts)]
      (when (not ok?)
        (builtin.find_files find-opts))))

  mod)
