#    ___ ___ _ ___ _____ _ _
#   (_-</ -_) '_\ V / -_) '_|
#   /__/\___|_|  \_/\___|_|
#
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/nixos/core/_default.nix
    ../../modules/nixos/server/_default.nix

    ./boot.nix
    ./module_toggle.nix
    ./networking.nix
    ./ssh.nix
    ./user+groups.nix
    ./agenix.nix
    ./zed.nix
    ./samba.nix
    ./avahi.nix
    ./msmtp.nix
  ];

  system.stateVersion = "25.05";
}
