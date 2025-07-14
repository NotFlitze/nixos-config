{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.modules.agenix;
in {
  options.modules.agenix.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the agenix module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      inputs.agenix.packages.${pkgs.system}.default
    ];
  };
}
