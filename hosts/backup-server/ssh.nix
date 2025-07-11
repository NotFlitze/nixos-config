{ ... }: 

  {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
#      PermitRootLogin = "yes";
    };
  };

  users.users."user".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8y5HzRXz4sUFmgcrMI3cbBlYQJmwPI3/5mAPTWi0Fv user@desktop" # from desktop
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOZ1CpP7Rc1kkuOnOUhbMGdEVs9xEeuxC5CnIaHPaID user@laptop" # from laptop
  ];

  users.users."root".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDdmqW62JWFioKMoLQmmpX2Cb1t9RFWRgSlNcQJdVG+R user@server" # from server
  ];

  }