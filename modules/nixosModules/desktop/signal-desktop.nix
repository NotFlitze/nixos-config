{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules."signal-desktop";
in {
  options.modules."signal-desktop".enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the signal-desktop module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [signal-desktop];
  };
}
