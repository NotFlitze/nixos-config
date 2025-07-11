{ ... }: 

  {
  users.users.user = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };
  }