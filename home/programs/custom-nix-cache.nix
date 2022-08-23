{ config, lib, secret, ... }:

let
  user-bin-directory = "${config.home.homeDirectory}/.bin";
  cache = secret.nix-cache.nifoc;
in
{
  home.file."${user-bin-directory}/upload-nifoc-nix-cache" = lib.mkIf cache.enabled {
    text = ''
      #!/usr/bin/env nix-shell
      #!nix-shell -i bash -p sqlite

      # Make sure the files are available to root on NixOS and macOS
      sudo mkdir ${cache.rootDir}/.aws 2> /dev/null
      sudo cp "$HOME/.aws/credentials" ${cache.rootDir}/.aws/

      minTimestamp=$(expr $(date +%s) - 1800)
      uncachedHashes=$(echo "SELECT DISTINCT hashPart FROM NARs WHERE present = 0 AND timestamp >= $minTimestamp;" | sudo sqlite3 "${cache.database}")
      signingKey="$HOME/.config/nifoc-nix/${cache.signingKey}"

      for uncachedHash in $uncachedHashes; do
        storePath=$(readlink -f /nix/store/$uncachedHash-*)

        if [[ $storePath == *"darwin-system"* ]] ||
           [[ $storePath == *"nixos-system"* ]] ||
           [[ $storePath == *"-system-"* ]] ||
           [[ $storePath == *"home-manager"* ]] ||
           [[ $storePath == *"-etc" ]] ||
           [[ $storePath == *"-source" ]] ||
           [[ $storePath == *"-launchd" ]] ||
           [[ $storePath == *"-fonts" ]] ||
           [[ $storePath == *"-darwin-manual-"* ]] ||
           [[ $storePath == *"-manual-olinkdb" ]] ||
           [[ $storePath == *"-manual-combined" ]] ||
           [[ $storePath == *"-man-pages" ]] ||
           [[ $storePath == *"-darwin-manpages" ]] ||
           [[ $storePath == *"-generated-docbook" ]] ||
           [[ $storePath == *"-fish-completions" ]] ||
           [[ $storePath == *".drv" ]] ||
           [[ $storePath == *".drv.chroot" ]] ||
           [[ $storePath == *".check" ]] ||
           [[ $storePath == *".lock" ]] ||
           [[ $storePath == *"-*" ]]; then
          echo "Skipping: $storePath"
          continue
        fi

        # Ignore Neovim-related packages for now, because they will be recreated after every nightly update.
        # Might work better once nix is CA.
        if [[ $storePath == *"-vim-pack-dir" ]] ||
           [[ $storePath == *"-vimplugin-"* ]] ||
           [[ $storePath == *"-neovim-unwrapped-master" ]] ||
           [[ $storePath == *"-vim-command-check-hook" ]] ||
           [[ $storePath == *"-neovim-require-check-hook" ]] ||
           [[ $storePath == *"-neovim-master-fish-completions" ]]; then
          echo "Skipping: $storePath"
          continue
        fi

        if [ "$1" = "--list" ]; then
          echo "$storePath"
        else
          curl -I --fail --silent "https://cache.nixos.org/$uncachedHash.narinfo" > /dev/null
          cached_nixos="$?"

          if [ $cached_nixos -eq 0 ]; then
            echo "Already cached on NixOS: $storePath ..."
          else
            curl -I --fail --silent "https://nix-community.cachix.org/$uncachedHash.narinfo" > /dev/null
            cached_cachix_nixcommunity="$?"

            curl -I --fail --silent "https://nifoc.cachix.org/$uncachedHash.narinfo" > /dev/null
            cached_cachix_nifoc="$?"

            if [ $cached_cachix_nixcommunity -eq 0 ] || [ $cached_cachix_nifoc -eq 0 ]; then
              echo "Already cached on Cachix: $storePath ..."
            else
              sudo -H nix store sign --key-file $signingKey $storePath

              echo "Uploading $storePath ..."
              sudo -H nix copy --to '${cache.s3Url}' $storePath
            fi
          fi
        fi
      done
    '';

    executable = true;
  };

  home.file."${config.home.homeDirectory}/.aws/credentials" = lib.mkIf cache.enabled {
    text = ''
      [nixbldr]
      aws_access_key_id=${cache.accessKeyId}
      aws_secret_access_key=${cache.secretAccessKey}
    '';
  };

  xdg.configFile."nifoc-nix/${cache.signingKey}" = lib.mkIf cache.enabled {
    text = cache.signingKeyValue;
  };
}
