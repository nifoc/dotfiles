{
  age.secrets = {
    freshrss-user-password = {
      file = ./freshrss/userPassword.age;
      owner = "freshrss";
      group = "freshrss";
    };

    freshrss-database-password = {
      file = ./freshrss/databasePassword.age;
      owner = "freshrss";
      group = "freshrss";
    };
  };
}
