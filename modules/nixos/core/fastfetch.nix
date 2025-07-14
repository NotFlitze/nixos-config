{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.fastfetch;
in {
  options.modules.fastfetch.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the fastfetch module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [fastfetch];
  };
}
