{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.rofi;
in {
  options.modules.rofi.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the rofi module";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
  };
}
