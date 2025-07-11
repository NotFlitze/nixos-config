{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.freecad-wayland;
in {
  options.modules.freecad-wayland.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the freecad-wayland module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [freecad-wayland];
  };
}
