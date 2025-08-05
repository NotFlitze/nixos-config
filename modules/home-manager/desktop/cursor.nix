{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.cursor;
in {
  options.modules.cursor.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the cursor module";
  };

  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 10;
    };

    gtk.cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 10;
    };
  };
}
