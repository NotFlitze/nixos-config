{ ... }: 

  {
  users.users.user = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };

  users.users.sambauser1 = {
    isNormalUser = true;
    extraGroups = ["sambauser"];
  };

  users.users.sambauser2 = {
    isNormalUser = true;
    extraGroups = ["sambauser"];
  };

  users.groups.sambauser = {};

  users.groups.sambauser1grp = {};

  users.groups.sambauser2grp = {};
  }