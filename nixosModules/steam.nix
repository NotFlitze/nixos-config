{ config, lib, pkgs, ... }:

let
  cfg = config.modules.steam;
in
{
  options.modules.steam.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the steam module";
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}