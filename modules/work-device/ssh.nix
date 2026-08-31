{
  den.aspects.work-device = {
    homeManager = {
      programs.ssh = {
        includes = [
          "~/.ssh/config_work"
        ];
      };
    };
  };
}
