{ ... }: 

  {
    imports =
    [
      ../system/core/_core-default.nix
      ../system/networking/_networking-default.nix
      ../system/desktop/_desktop-default.nix

      ../packages/cli/_cli-default.nix
      ../packages/gui/_gui-default.nix
    ];
}