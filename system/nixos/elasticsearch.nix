{
  services.elasticsearch = {
    enable = true;

    cluster_name = "elasticsearch-tanker";
    single_node = true;

    extraConf = ''
      xpack.security.enabled: false
    '';
  };
}
