{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.geekbench;
in {
  options.modules.geekbench.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the geekbench module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [geekbench];
  };
}
