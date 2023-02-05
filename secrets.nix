let
  user-daniel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1UfCIu7jUe64iQmp2UUyAgqZ3IYdMOo/Me6hRTnKoG";

  system-sail = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJMs1BqZ+MC7XBwV+dZW8EmaZt2cOg/xcOBPS9KSzIl";

  sail = [ user-daniel system-sail ];
in
{
  "agenix/hosts/sail/freshrss/userPassword.age".publicKeys = sail;
}
