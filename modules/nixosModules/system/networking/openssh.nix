{ config, lib, pkgs, ... }:

let
  cfg = config.modules.openssh;
in
{
  options.modules.openssh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the openssh service";
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;   # research to use a key !
#        PermitRootLogin = "yes";        # prob unessesary $ sudo bash works ig
      };
    };
  };
}
