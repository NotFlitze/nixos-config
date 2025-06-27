{ config, lib, pkgs, ... }:

let
  cfg = config.modules.bootloader_grub;
in
{
  options.modules.bootloader_grub.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the bootloader_grub module";
  };

  config = lib.mkIf cfg.enable {
    boot.loader.grub = {
    enable = true;
    efiSupport = false;
    useOSProber = true;
    device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_500GB_S4XBNF0M804421N";
    };
  };
}
