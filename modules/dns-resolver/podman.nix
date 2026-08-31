{
  den.aspects.dns-resolver = {
    nixos = {
      virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
    };
  };
}
