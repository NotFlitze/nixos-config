#         _     _            
#    _ _ (_)_ _| |_ ___ _ __ 
#   | ' \| \ \ /  _/ _ \ '_ \
#   |_||_|_/_\_\\__\___/ .__/
#                      |_|

{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/cowsay.nix
  ];

  modules.cowsay.enable = true;

  # enables the use of unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware = {
    enableAllFirmware = true;
    graphics.enable = true;
  };

  services = {
    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
      jack.enable = true;
      audio.enable = true;
    };

    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
      settings.PermitRootLogin = "yes";
    };

    libinput.enable = true; # touchpad
  };

  # --- gnome stuff idk research --- #

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
  ];


  services.xserver.displayManager.gdm.wayland = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

# --- --- #


  # for enabeling flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixtop";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [22];
  };

  # time zone
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  
  console.keyMap = "de";

  users.users.user = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-broadcom;

  services.dbus.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
    fastfetch
    evtest
    firefox
    modrinth-app
    alejandra
    keepassxc
    spotify
    thunderbird
    ethtool
    tree
    libreoffice-still
    cpu-x
    prusa-slicer
    geekbench
    glmark2
#    freecad-waylandy

# --- gnome remove after --- #
    gnome-tweaks
  ];

  system.stateVersion = "24.11"; # Don't change that do research !!!
}
