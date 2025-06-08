{ config, lib, ... }:

let
  cfg = config.modules.trackpad;
in
{
  options.modules.trackpad.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable trackpad module";
  };

  config = lib.mkIf cfg.enable {
    services.libinput = {
      enable = true;
    };
  };
}
