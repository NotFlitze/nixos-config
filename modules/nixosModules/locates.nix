{ config, lib, pkgs, ... }:

let
  cfg = config.modules.locates;
in
{
  options.modules.locates.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the locates module";
  };

  config = lib.mkIf cfg.enable {
      time.timeZone = "Europe/Berlin";

      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
       LC_ADDRESS = "de_DE.UTF-8";
       LC_IDENTIFICATION = "de_DE.UTF-8";
       LC_MEASUREMENT = "de_DE.UTF-8";
       LC_MONETARY = "de_DE.UTF-8";
       LC_NAME = "de_DE.UTF-8";
       LC_NUMERIC = "de_DE.UTF-8";
       LC_PAPER = "de_DE.UTF-8";
       LC_TELEPHONE = "de_DE.UTF-8";
       LC_TIME = "de_DE.UTF-8";
  };
  };
}