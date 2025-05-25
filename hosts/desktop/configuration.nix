#       _        _   _            
#    __| |___ __| |_| |_ ___ _ __ 
#   / _` / -_|_-< / /  _/ _ \ '_ \
#   \__,_\___/__/_\_\\__\___/ .__/
#                           |_|   

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../nixosModules/steam.nix
      ../../nixosModules/spotify.nix
      ../../nixosModules/locates.nix
      ../../nixosModules/bootloader.nix
      ../../nixosModules/enableflakes.nix
      ../../nixosModules/allowunfree.nix
      ../../nixosModules/tree.nix
      ../../home-managerModules/firefox.nix
      ../../nixosModules/cmatrix.nix
      ../../nixosModules/grim.nix
      ../../nixosModules/gnome-tweaks.nix
      ../../nixosModules/wl-clipboard.nix
    ];

  networking.hostName = "nixos";
  
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

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
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
