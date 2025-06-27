{ config, lib, pkgs, ... }:

let
  cfg = config.modules.prismlauncher;
in
{
  options.modules."prismlauncher".enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the prismlauncher module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ prismlauncher ];
  };
}