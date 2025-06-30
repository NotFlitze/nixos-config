{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.tor-browser;
in {
  options.modules.tor-browser.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the tor-browser module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [tor-browser];
  };
}
