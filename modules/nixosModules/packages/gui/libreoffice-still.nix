{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules."libreoffice-still";
in {
  options.modules."libreoffice-still".enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the libreoffice-still module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [libreoffice-still];
  };
}
