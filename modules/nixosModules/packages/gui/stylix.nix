{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.stylix;
in {
  options.modules.stylix.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the stylix module";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      # image = ../../../../wallpapers/wallpaper1.jpg;
       base16Scheme = {
         base00 = "000000";
         base01 = "000000";
         base02 = "000000";
         base03 = "000000";
         base04 = "62d6e8";
         base05 = "e9e9f4";
         base06 = "f1f2f8";
         base07 = "f7f7fb";
         base08 = "800000";
         base09 = "ac0000";
         base0A = "008000";
         base0B = "ffffff";
         base0C = "000080";
         base0D = "0000ac";
         base0E = "0000f0";
         base0F = "00ba00";
       };
      polarity = "dark";
      opacity.terminal = 1.0;
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 10;
      };
      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.hack;
          name = "Hack Nerd Font";
        };
        sansSerif = {
          package = pkgs.montserrat;
          name = "Montserrat";
        };
        serif = {
          package = pkgs.montserrat;
          name = "Montserrat";
        };
        sizes = {
          applications = 10;
          terminal = 10;
          desktop = 10;
          popups = 10;
        };
      };
    };
  };
}
