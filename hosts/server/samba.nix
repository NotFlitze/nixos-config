{...}: {
  # samba config
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "server";
        "security" = "user";
        "map to guest" = "never";
      };

      "share" = {
        "path" = "/nasdata/data/share";
        "browseable" = "no";
        "read only" = "no";
        "valid users" = "sambauser1 sambauser2";
        "force group" = "sambauser";
        "create mask" = "0660";
        "directory mask" = "0770";
        "guest ok" = "no";
      };

      "sambauser1" = {
        "path" = "/nasdata/data/sambauser1";
        "browseable" = "no";
        "read only" = "no";
        "valid users" = "sambauser1";
        "force group" = "sambauser1grp";
        "create mask" = "0600";
        "directory mask" = "0700";
        "guest ok" = "no";
      };

      "sambauser2" = {
        "path" = "/nasdata/data/sambauser2";
        "browseable" = "no";
        "read only" = "no";
        "valid users" = "sambauser2";
        "force group" = "sambauser2grp";
        "create mask" = "0600";
        "directory mask" = "0700";
        "guest ok" = "no";
      };
    };
  };

  # for Windows
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
