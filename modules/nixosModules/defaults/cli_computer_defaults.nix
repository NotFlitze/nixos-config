{ ... }: 

  {
    imports =
    [
      ../system/core/_core-default.nix
      ../system/networking/_networking-default.nix

      ../packages/cli/_cli-default.nix
    ];
}
