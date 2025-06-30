{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.keepassxc;
in {
  options.modules.keepassxc.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the keepassxc module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [keepassxc];
  };
}
