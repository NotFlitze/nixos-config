{ config, lib, pkgs, ... }:

let
  cfg = config.modules.zsh;
in
{
  options.modules.zsh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the zsh module";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      package = pkgs.zsh;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;
      autosuggestion.enable = true;
    };

    # programs.zsh.ohMyZsh = {
    #   enable = true;
    #   plugins = [ ];
    #   theme = "";
    # };

    programs.zsh.history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [ ];
    };

    programs.zsh.shellAliases = {
      nixos-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
    };
  };
}
