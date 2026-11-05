(let [_hyper [:cmd :alt :ctrl :shift]
      hostname (hs.host.localizedName)
      home (os.getenv :HOME)
      config-dir (.. home :/.config/hammerspoon/)
      _http (require :hs.http)
      _ipc (require :hs.ipc)]
  ;; Hot-reload configuration
  (: (hs.pathwatcher.new config-dir hs.reload) :start)
  ;; Caffeine
  (hs.spoons.use :Caffeine {:start true})
  ;; USBDeviceActions

  (fn switch-monitor-input [connected]
    (let [input (if connected :USB-C "Display Port")
          url "https://homeassistant.internal.kempkens.network/api/webhook/daniels-monitor-change-source"
          data (.. "{\"source\":\"" input "\"}")
          headers {:content-type :application/json}]
      (hs.http.put url data headers)))

  (when (= hostname :Pallas)
    (hs.spoons.use :USBDeviceActions
                   {:config {:devices {"Keychron Q1" {:fn switch-monitor-input}}}
                    :start true})))
