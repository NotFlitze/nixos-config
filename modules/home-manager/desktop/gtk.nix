{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.gtk;
in {
  options.modules.gtk.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the gtk module";
  };

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      theme = {
        name = "Materia-Black";
        package = pkgs.materia-theme;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 10;
      };

      font = {
        name = "Fira Sans";
        package = pkgs.fira;
        #      size = 11;
      };

      gtk4 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = true;
        };
      };
    };

    # mabye make a seperate module
    home.pointerCursor = {
      gtk.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 10;
    };
  };
}
