{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.thunderbird;
in {
  options.modules.thunderbird.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the thunderbird module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [thunderbird];
  };
}
