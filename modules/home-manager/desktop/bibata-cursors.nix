{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.bibata-cursors;
in {
  options.modules.bibata-cursors.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the bibata-cursors module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [bibata-cursors];
  };
}
