{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.ethtool;
in {
  options.modules.ethtool.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the ethtool module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ethtool];
  };
}
