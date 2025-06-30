{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.obsidian;
in {
  options.modules.obsidian.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the obsidian module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [obsidian];
  };
}
