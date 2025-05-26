{ config, lib, pkgs, ... }:

let
  cfg = config.modules.git;
in
{
  options.modules.git.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the git module";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;
      userName = "NotFlitze";
      userEmail = "167577764+NotFlitze@users.noreply.github.com";
    };
  };
}