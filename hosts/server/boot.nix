{ ... }: 

  {
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
  }