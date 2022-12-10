(let [jdtls (require :jdtls)
      project-name (vim.fn.fnamemodify (vim.fn.getcwd) ":p:h:t")
      cache-dir (.. (vim.loop.os_homedir) :/.cache/jdtls)
      jars-dir (.. cache-dir :/jars)
      workspace-dir (.. cache-dir :/workspace/ project-name)
      formatter-config (.. cache-dir :/config/formatter. project-name :.xml)
      config {:cmd [:jdt-language-server :-data workspace-dir]
              :root_dir (vim.fs.dirname (. (vim.fs.find [:.gradlew
                                                         :.git
                                                         :.mvnw]
                                                        {:upward true})
                                           1))}]
  (set vim.env.JAVA_OPTS (.. "-javaagent:" jars-dir :/lombok.jar))
  (jdtls.start_or_attach config))

