{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./waybar.nix
    ./nvim.nix
    ./git.nix
    ./dunst.nix

  ];

  home.username = "dmitrj";
  home.homeDirectory = "/home/dmitrj";
  
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
