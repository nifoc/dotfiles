(let [mod {}
      builtin (require :telescope.builtin)
      themes (require :telescope.themes)]
  (fn mod.find-files []
    (let [find-opts (themes.get_ivy {:find_command [:fd
                                                    :--type
                                                    :file
                                                    :--hidden
                                                    :--ignore-vcs
                                                    :-L
                                                    :--color
                                                    :never
                                                    :--exclude
                                                    :.git
                                                    :--exclude
                                                    :node_modules
                                                    :--exclude
                                                    :.direnv]})]
      (builtin.find_files find-opts)))

  (fn mod.project-files []
    (let [git-opts (themes.get_ivy)
          ok? (pcall builtin.git_files git-opts)]
      (when (not ok?)
        (mod.find-files))))

  mod)
