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

      minTimestamp=$(expr $(date +%s) - 3600)
      uncachedHashes=$(echo "SELECT DISTINCT hashPart FROM NARs WHERE present = 0 AND timestamp >= $minTimestamp;" | sudo sqlite3 "${cache.database}")
      signingKey="$HOME/.config/nifoc-nix/${cache.signingKey}"

      for uncachedHash in $uncachedHashes; do
        storePath=$(readlink -f /nix/store/$uncachedHash-*)

        if [[ $storePath == *"darwin-system"* ]] ||
           [[ $storePath == *"nixos-system"* ]] ||
           [[ $storePath == *"home-manager-generation"* ]] ||
           [[ $storePath == *"-etc" ]] ||
           [[ $storePath == *"-source" ]] ||
           [[ $storePath == *"-vim-pack-dir" ]] ||
           [[ $storePath == *".drv" ]] ||
           [[ $storePath == *".drv.chroot" ]] ||
           [[ $storePath == *".check" ]] ||
           [[ $storePath == *".lock" ]]; then
          continue
        fi

        if [ "$1" = "--list" ]; then
          echo "$storePath"
        else
          sudo -H nix store sign --key-file $signingKey $storePath

          echo "Uploading $storePath ..."
          sudo -H nix copy --to '${cache.s3Url}' $storePath
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
