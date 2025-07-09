{
  services = {
    samba = {
      enable = true;
      openFirewall = false;

      settings = {
        global = {
          security = "user";
          workgroup = "WORKGROUP";
          "server string" = "Krypton";
          "hosts allow" = "10.0.0.0/255.255.255.0";
          interfaces = "eth*";
          "dns proxy" = false;
          "log level" = 1;
          "logging" = "systemd";

          "server min protocol" = "SMB3";
          "smb encrypt" = "required";
          "client signing" = "mandatory";
          "server signing" = "mandatory";

          "socket options" = "TCP_NODELAY IPTOS_LOWDELAY";
          "use sendfile" = true;

          "vfs objects" = "fruit streams_xattr";
          "fruit:aapl" = "yes";
          "fruit:metadata" = "stream";
          "fruit:model" = "MacSamba";
          "fruit:veto_appledouble" = "no";
          "fruit:nfs_aces" = "no";
          "fruit:wipe_intentionally_left_blank_rfork" = "yes";
          "fruit:delete_empty_adfiles" = "yes";
          "fruit:copyfile" = "yes";
          "fruit:posix_rename" = "yes";
        };

        HomeDozer = {
          comment = "Home on Dozer";
          path = "/dozer/home/daniel";
          "force user" = "daniel";
          "force group" = "daniel";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          writable = "yes";
          browseable = "yes";
          printable = "no";
          "valid users" = "daniel";
        };

        Instagram = {
          comment = "Instagram on Dozer";
          path = "/dozer/home/daniel/Pictures/Instagram";
          "force user" = "daniel";
          "force group" = "daniel";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          writable = "yes";
          browseable = "yes";
          printable = "no";
          "valid users" = "daniel";
        };

        MediaScraper = {
          comment = "MediaScraper on Dozer";
          path = "/dozer/JailVault/media-scraper";
          "force user" = "daniel";
          "force group" = "user_media";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          writable = "yes";
          browseable = "yes";
          printable = "no";
          "valid users" = "daniel";
        };

        MediaVault = {
          comment = "MediaVault on Dozer";
          path = "/dozer/MediaVault";
          "force user" = "daniel";
          "force group" = "user_media";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          writable = "yes";
          browseable = "yes";
          printable = "no";
          "valid users" = "daniel";
        };

        Downloads = {
          comment = "Downloads on Dozer";
          path = "/dozer/downloads";
          "force user" = "daniel";
          "force group" = "user_media";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          writable = "yes";
          browseable = "yes";
          printable = "no";
          "valid users" = "daniel";
        };
      };
    };

    samba-wsdd = {
      enable = true;
      openFirewall = false;
    };

    avahi = {
      enable = true;
      openFirewall = false;
      allowInterfaces = [ "eth0" ];

      publish = {
        enable = true;
        userServices = true;
      };

      nssmdns4 = true;
    };
  };

  networking.firewall.interfaces."eth0" = {
    allowedUDPPorts = [
      # Samba
      137
      138
      # WSDD
      3702
      # Avahi
      5353
    ];
    allowedTCPPorts = [
      # Samba
      139
      445
      # WSDD
      5357
    ];
  };
}
