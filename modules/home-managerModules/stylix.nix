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
      image = ../../wallpapers/wallpaper1.jpg;
      # base16Scheme = {
      #   base00 = "282936";
      #   base01 = "3a3c4e";
      #   base02 = "4d4f68";
      #   base03 = "626483";
      #   base04 = "62d6e8";
      #   base05 = "e9e9f4";
      #   base06 = "f1f2f8";
      #   base07 = "f7f7fb";
      #   base08 = "ea51b2";
      #   base09 = "b45bcf";
      #   base0A = "00f769";
      #   base0B = "ebff87";
      #   base0C = "a1efe4";
      #   base0D = "62d6e8";
      #   base0E = "b45bcf";
      #   base0F = "00f769";
      # };
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
