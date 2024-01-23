{
  services.loki = {
    enable = true;

    configuration = {
      auth_enabled = false;
      analytics.reporting_enabled = false;

      server = {
        http_listen_port = 3100;
      };

      common = {
        ring = {
          instance_addr = "127.0.0.1";
          kvstore.store = "inmemory";
        };

        replication_factor = 1;
        path_prefix = "/var/lib/loki/common";
      };

      schema_config = {
        configs = [
          {
            from = "2024-01-23";
            store = "tsdb";
            object_store = "filesystem";
            schema = "v12";
            index = {
              prefix = "index_";
              period = "24h";
            };
          }
        ];
      };
    };
  };
}
