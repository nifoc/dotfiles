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
          "max log size" = "50";
          "dns proxy" = false;
          "syslog only" = true;

          "vfs objects" = "fruit streams_xattr";
          "fruit:metadata" = "stream";
          "fruit:model" = "MacSamba";
          "fruit:veto_appledouble" = "no";
          "fruit:nfs_aces" = "no";
          "fruit:wipe_intentionally_left_blank_rfork" = "yes";
          "fruit:delete_empty_adfiles" = "yes";
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
