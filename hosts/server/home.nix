{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../modules/home-managerModules/git.nix
      ../../modules/home-managerModules/htop.nix
      ../../modules/home-managerModules/fastfetch.nix
    ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}