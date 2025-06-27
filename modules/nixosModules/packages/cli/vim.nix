{ config, lib, pkgs, ... }:

let
  cfg = config.modules.vim;
in
{
  options.modules.vim.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the vim module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ vim ];
  };
}