{...}: {
  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    useOSProber = true;
    device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_250GB_S3YJNB0K358813Y";
  };

  boot = {
    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportRoot = false;
      extraPools = ["backup"];
    };
  };
}
