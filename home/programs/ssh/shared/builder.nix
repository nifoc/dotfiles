let
  secret-sail = import ../../../../secret/hosts/sail.nix;
in
{
  matchBlocks = {
    "builder-sail" = {
      hostname = secret-sail.publicIP;
      port = 22;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };
  };
}
