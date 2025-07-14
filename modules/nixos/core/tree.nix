{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.tree;
in {
  options.modules.tree.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the tree module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [tree];
  };
}
