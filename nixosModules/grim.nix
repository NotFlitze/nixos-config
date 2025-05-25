{ config, lib, pkgs, ... }:

let
  cfg = config.modules.grim;
in
{
  options.modules.grim.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the grim module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ grim ];
  };
}

# screenshot tool