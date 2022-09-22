(let [mod {}
      spinner-frames ["⣾" "⣽" "⣻" "⢿" "⡿" "⣟" "⣯" "⣷"]
      client-notifications {}]
  ;; Progress Notifications
  ;; Based on: https://github.com/rcarriga/nvim-notify/wiki/Usage-Recipes#progress-updates

  (fn get-notification-data [client-id token]
    (when (= (. client-notifications client-id) nil)
      (tset client-notifications client-id {}))
    (when (= (. client-notifications client-id token) nil)
      (tset client-notifications client-id token {}))
    (. client-notifications client-id token))

  (fn update-notifcation-spinner [client-id token]
    (let [notification-data (get-notification-data client-id token)]
      (when notification-data.spinner
        (let [new-spinner (% (+ notification-data.spinner 1)
                             (length spinner-frames))]
          (set notification-data.spinner new-spinner)
          (set notification-data.notification
               (vim.notify nil nil
                           {:hide_from_history true
                            :icon (. spinner-frames new-spinner)
                            :replace notification-data.notification}))
          (vim.defer_fn #(update-notifcation-spinner client-id token))))))

  (fn format-notifcation-title [title client-name]
    (.. client-name (if (> (length title) 0) (.. ": " title) "")))

  (fn format-notifcation-message [message percentage]
    (.. (if percentage (.. percentage "%\t") "") (if message message "")))

  (fn handle-progress [err result ctx]
    (let [client-id ctx.client_id
          val result.value
          kind val.kind
          lsp-client (vim.lsp.get_client_by_id client-id)
          client-name lsp-client.name
          notification-data (get-notification-data client-id result.token)]
      (if (= kind :begin)
          (let [message (format-notifcation-message val.message val.percentage)]
            (set notification-data.notification
                 (vim.notify message :info
                             {:title (format-notifcation-title val.title
                                                               client-name)
                              :icon (. spinner-frames 1)
                              :timeout false
                              :hide_from_history false}))
            (set notification-data.spinner 1)
            (update-notifcation-spinner client-id result.token))
          (and (= kind :report) notification-data)
          (let [message (format-notifcation-message val.message val.percentage)]
            (set notification-data.notification
                 (vim.notify message :info
                             {:replace notification-data.notification
                              :hide_from_history false})))
          (and (= kind :end) notification-data)
          (let [message (if val.message
                            (format-notifcation-message val.message)
                            :Complete)]
            (set notification-data.notification
                 (vim.notify message :info
                             {:icon ""
                              :replace notification-data.notification
                              :timeout 3000}))
            (set notification-data.spinner nil)))))

  ;; Public Interface

  (fn mod.register-progress-handler []
    (tset vim.lsp.handlers :$/progress handle-progress))

  mod)

