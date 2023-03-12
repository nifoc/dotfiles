let
  secret-sail = import ../../../../secret/hosts/sail.nix;
in
{
  matchBlocks = {
    "builder-sail" = {
      hostname = "100.113.242.85";
      port = 22;
      user = "root";
      identityFile = "~/.ssh/Hetzner.pub";
      identitiesOnly = true;
    };
  };
}
