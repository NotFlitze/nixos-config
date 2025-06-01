{ ... }: 

  {
    imports =
    [
      ./allowunfree.nix
      ./bootloader.nix
      ./consoleKeymap.nix
      ./enableflakes.nix
      ./hardware.nix
      ./locates.nix
    ];
}