{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.cmatrix;
in {
  options.modules.cmatrix.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the cmatrix module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [cmatrix];
  };
}
