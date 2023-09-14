{ pkgs, config, name, tag, ... }:

let
  forgejoUrl = "https://git.kempkens.io";
in
{
  services.gitea-actions-runner = {
    package = pkgs.forgejo-actions-runner;

    instances = {
      tanker = {
        enable = true;
        url = forgejoUrl;

        inherit name;
        tokenFile = config.age.secrets.forgejo-actions-token.path;

        labels = [
          "${tag}:docker://ghcr.io/catthehacker/ubuntu:act-latest"
        ];
      };
    };
  };
}
