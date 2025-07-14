{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.waybar;
in {
  options.modules.waybar.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the waybar module";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          modules-center = ["clock"];
        };
      };
    };
  };
}
