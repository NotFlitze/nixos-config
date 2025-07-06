#    ___ ___ _ ___ _____ _ _
#   (_-</ -_) '_\ V / -_) '_|
#   /__/\___|_|  \_/\___|_|
#
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixosModules/defaults/cli_computer_defaults.nix
  ];

  # --- module options --- # 

  # --- networking --- #

  networking.hostName = "server";

  networking.hostId = "f6b91edc";

  networking.firewall.enable = true;

  networking.firewall.allowPing = true;

  # --- ssh --- #

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users."user".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM8fhpSSDobR9JQ7/QXzvGJ2piFjUU051rFJnTMn2wUe user@laptop" # from laptop
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOOj/Vm27o+LN3nA/gBnJDRFFOWNxal/sj4ZNqWp8Qka user@desktop" # from desktop
  ];

  # --- user + groups --- #

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

  # --- host spetific stuff --- #

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

  services.samba-wsdd = {
    # for Windows
    enable = true;
    openFirewall = true;
  };

  services.avahi = {
    # for macOS/iOS & Linux-Clients per mDNS/Bonjour
    publish.enable = true;
    publish.userServices = true;
    #    ssmdns4 = true;
    enable = true;
    openFirewall = true;
  };

  age.identityPaths = [
    "/root/.ssh/mailbox.org_agenix_key"
  ];

  age.secrets.mailbox-smtp-password = {
    file = ../../secrets/mailbox-smtp-password.age;
    owner = "user";
    group = "users";
    mode = "0400";
  };
  
  programs.msmtp = {
  enable = true;
    accounts.default = {
      auth = true;
      tls = true;
      tls_starttls = true;
      host = "smtp.mailbox.org";
      port = 587;
      from = "server-notifications@mailbox.org";
      user = "felixbo@mailbox.org";
      passwordeval = "cat /run/agenix/mailbox-smtp-password";
    };
    setSendmail = true;
  };

  services.zfs.zed = {
    enableMail = true;
    settings = {
      ZED_EMAIL_ADDR = [ "felixbo@mailbox.org" ];
      ZED_EMAIL_PROG = "${pkgs.msmtp}/bin/msmtp";
      ZED_EMAIL_OPTS = "@ADDRESS@";
    };
  };

  # --- boot --- #

  boot = {
    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportRoot = false;
      extraPools = ["nasdata"];
    };
  };

  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    useOSProber = true;
    device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_500GB_S4XBNF0M804421N";
  };

  # --- #

  system.stateVersion = "25.05";
}
