{ ... }: 

  {
    imports =
    [
      ./bluethooth/blueman.nix
      ./bluethooth/bluetooth.nix

      ./gnome/dbus.nix
      ./gnome/gdm.nix
      ./gnome/gnome.nix

      ./laptop/fprintd.nix
      ./laptop/trackpad.nix

      ./printing/printing.nix

      ./sound/pipewire.nix

      ./wayland/wl-clipboard.nix
    ];
}