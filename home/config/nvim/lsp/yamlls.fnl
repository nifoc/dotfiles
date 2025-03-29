(local schemastore (require :schemastore))

{:cmd [:yaml-language-server :--stdio]
 :root_markers [:.git]
 :filetypes [:yaml :yaml.docker-compose :yaml.gitlab]
 :settings {:yaml {:schemaStore {:enable false :url ""}
                   :schemas (schemastore.yaml.schemas)}
            :redhat {:telemetry {:enabled false}}}}
