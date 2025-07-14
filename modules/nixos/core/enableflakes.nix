{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.enableflakes;
in {
  options.modules.enableflakes.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the enableflakes module";
  };

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
