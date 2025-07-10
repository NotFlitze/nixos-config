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
        base00 = "000000"; # Background (true black)
        base01 = "1e1e1e"; # Lighter background (status bars, etc.)
        base02 = "222222"; # Selection background
        base03 = "292929"; # Comments, subtle UI
        base04 = "8ecae6"; # Dark foreground (status bar text)
        base05 = "f2f2f2"; # Default foreground (main text, off-white for comfort)[2]
        base06 = "ffffff"; # Light foreground (rare, headings)
        base07 = "e0e0e0"; # Light background (rare)
        base08 = "ff5370"; # Red: errors, variables
        base09 = "f78c6c"; # Orange: constants, numbers
        base0A = "ffcb6b"; # Yellow: classes, highlights
        base0B = "c3e88d"; # Green: strings, success
        base0C = "89ddff"; # Cyan: regex, special
        base0D = "82aaff"; # Blue: functions, keywords
        base0E = "c792ea"; # Purple: markup, changed text
        base0F = "ff869a"; # Pink: deprecated, tags
      };
      polarity = "dark";
      opacity.terminal = 0.9;
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
