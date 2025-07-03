{ ... }: 

  {
    imports =
    [
      ./alejandra.nix
      ./btop-rocm.nix
      ./cmatrix.nix
      ./cowsay.nix
      ./ethtool.nix
      ./evtest.nix
#      ./fastfetch.nix
      ./geekbench.nix
      ./glmark2.nix
      ./neofetch.nix
      ./pciutils.nix
      ./tree.nix
      ./vim.nix
      ./wget.nix
      ./tailscale.nix
    ];
}