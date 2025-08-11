#    _             _
#   | |__  __ _ __| |___  _ _ __ ___ ___ ___ _ ___ _____ _ _
#   | '_ \/ _` / _| / / || | '_ \___(_-</ -_) '_\ V / -_) '_|
#   |_.__/\__,_\__|_\_\\_,_| .__/   /__/\___|_|  \_/\___|_|
#                          |_|
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
  ];

  system.stateVersion = "24.11";
}
