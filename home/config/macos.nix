{
  targets.darwin.defaults = {
    "com.apple.dock" = {
      autohide = true;
      orientation = "left";
      mineffect = "scale";
      minimize-to-application = true;
      showhidden = true;
      show-recents = false;
      tilesize = 40;
      size-immutable = true;
    };

    "com.apple.finder" = {
      show-pathbar = true;
      show-external-hard-drives-on-desktop = true;
      show-hard-drives-on-desktop = true;
      show-mounted-servers-on-desktop = true;
      show-recent-tags = false;
      show-removable-media-on-desktop = true;
      show-sidebar = true;
    };
  };
}
