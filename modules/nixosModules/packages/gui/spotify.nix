{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.spotify;
in {
  options.modules.spotify.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the spotify module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [spotify];
  };
}
