{ config, lib, pkgs,... }:

let
  cfg = config.modules.Kernel_package_r8125;
in
{
  options.modules.Kernel_package_r8125.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the Kernel_package_r8125 module";
  };

  config = lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [ linuxKernel.packages.linux_6_12.r8125 ];
  };
}