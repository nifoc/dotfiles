{ secret, ... }:

{
  # Synapse

  systemd.tmpfiles.rules = [
    "d /etc/container-matrix/synapse 0755 991 991"
  ];

  environment.etc."container-matrix/synapse/homeserver.yaml" = {
    source = ../../secret/container/matrix/config/homeserver.yaml;
    mode = "0640";
    uid = 991;
    gid = 991;
  };
}
