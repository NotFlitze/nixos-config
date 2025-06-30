{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.starship;
in {
  options.modules.starship.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the starship module";
  };

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        add_newline = true;
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_status"
          "$cmd_duration"
          "$line_break"
          "$jobs"
          "$character"
        ];

        username = {
          show_always = true;
        };


        character = {
          success_symbol = "[❯](green)";
          error_symbol = "[❯](red)";
        };
        #        custom = {
        #          mysection = {
        #            format = "[$symbol]($style)";
        #            symbol = "✨";
        #            style = "yellow";
        #          };
      };
    };
  };
}
