{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.tailscale;
in {
  options.modules.tailscale.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the tailscale module";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;
  };
}
