{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.alacritty;
in {
  options.modules.alacritty.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the alacritty module";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}
