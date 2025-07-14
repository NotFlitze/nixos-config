{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.pipewire;
in {
  options.modules.pipewire.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the pipewire module";
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
      jack.enable = true;
      audio.enable = true; # not nessesary anymore remove after research
    };
  };
}
