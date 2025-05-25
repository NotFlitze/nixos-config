{ config, lib, pkgs, ... }:

let
  cfg = config.modules.bootloader;
in
{
  options.modules.bootloader.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the bootloader module";
  };

  config = lib.mkIf cfg.enable {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
  };
}