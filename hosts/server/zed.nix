{ ... }: 

  {
  services.zfs.zed = {
    enableMail = true;
    settings = {
      ZED_EMAIL_ADDR = [ "felixbo@mailbox.org" ];
      ZED_EMAIL_PROG = "${pkgs.msmtp}/bin/msmtp";
      ZED_EMAIL_OPTS = "@ADDRESS@";
    };
  };
  }