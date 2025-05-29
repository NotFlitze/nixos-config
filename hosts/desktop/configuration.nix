#       _        _   _            
#    __| |___ __| |_| |_ ___ _ __ 
#   / _` / -_|_-< / /  _/ _ \ '_ \
#   \__,_\___/__/_\_\\__\___/ .__/
#                           |_|   

{ config, pkgs, ... }:

{
  imports = # check for home-manager config for these programs
    [
      ./hardware-configuration.nix

      ../../modules/nixosModules/steam.nix
      ../../modules/nixosModules/spotify.nix
      ../../modules/nixosModules/locates.nix
      ../../modules/nixosModules/bootloader.nix
      ../../modules/nixosModules/enableflakes.nix
      ../../modules/nixosModules/allowunfree.nix
      ../../modules/nixosModules/tree.nix
      ../../modules/nixosModules/cmatrix.nix
      ../../modules/nixosModules/grim.nix
      ../../modules/nixosModules/gnome-tweaks.nix
      ../../modules/nixosModules/wl-clipboard.nix
      ../../modules/nixosModules/pipewire.nix
      ../../modules/nixosModules/bluetooth.nix
      ../../modules/nixosModules/consoleKeymap.nix
      ../../modules/nixosModules/vim.nix
      ../../modules/nixosModules/wget.nix
      ../../modules/nixosModules/fastfetch.nix
      ../../modules/nixosModules/evtest.nix
      ../../modules/nixosModules/modrinth-app.nix
      ../../modules/nixosModules/alejandra.nix
      ../../modules/nixosModules/keepassxc.nix
      ../../modules/nixosModules/thunderbird.nix
      ../../modules/nixosModules/ethtool.nix
      ../../modules/nixosModules/libreoffice-still.nix
      ../../modules/nixosModules/cpu-x.nix
      ../../modules/nixosModules/prusa-slicer.nix
      ../../modules/nixosModules/geekbench.nix
      ../../modules/nixosModules/glmark2.nix
      ../../modules/nixosModules/freecad-wayland.nix
      ../../modules/nixosModules/openssh.nix
      ../../modules/nixosModules/blueman.nix
      ../../modules/nixosModules/networkmanager.nix
      ../../modules/nixosModules/gdm.nix    # remove after hyprland
      ../../modules/nixosModules/gnome.nix    # remove after hyprland
      ../../modules/nixosModules/xkb.nix    # remove after hyprland
      ../../modules/nixosModules/printing.nix
      ../../modules/nixosModules/hardware.nix
      ../../modules/nixosModules/pciutils.nix
      ../../modules/nixosModules/btop-rocm.nix
      ../../modules/nixosModules/Kernel_package_r8125.nix
      ../../modules/nixosModules/neofetch.nix
      ../../modules/nixosModules/trackpad.nix
      ../../modules/nixosModules/fprintd.nix
    ];

   modules.trackpad.enable = false;

  networking.hostName = "desktop";

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "25.05";

}
