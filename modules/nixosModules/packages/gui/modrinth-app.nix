{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.modrinth-app;
in {
  options.modules."modrinth-app".enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the modrinth-app module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [modrinth-app];
  };
}
