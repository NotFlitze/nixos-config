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

      ../../modules/nixosModules/prusa-slicer.nix
    ];

  networking.hostName = "desktop";
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    neofetch
    pciutils
    linuxKernel.packages.linux_6_12.r8125
    modrinth-app
    btop-rocm
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system.stateVersion = "25.05";

}
