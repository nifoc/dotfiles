(let [_hyper [:cmd :alt :ctrl :shift]
      hostname (hs.host.localizedName)
      _ipc (require :hs.ipc)
      programs (require :programs)]
  ;; Caffeine
  (hs.spoons.use :Caffeine {:start true})
  ;; USBDeviceActions

  (fn switch-monitor-input [connected]
    (let [input (if connected :USB-C :DisplayPort)
          command (.. programs.mosquitto_pub " -h 10.0.0.230" " -m " input
                      " -t hadata/macos/daniels_monitor" " -u mqtt_bridge"
                      " -P verySecurePassword")]
      (hs.execute command false)))

  (when (= hostname :Pallas)
    (hs.spoons.use :USBDeviceActions
                   {:config {:devices {"Keychron Q1" {:fn switch-monitor-input}}}
                    :start true})))
