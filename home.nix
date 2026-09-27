{ config, pkgs, ... }:

{
  home.username = "dmitrj";
  home.homeDirectory = "/home/dmitrj";

  home.stateVersion = "26.05"; 

  # Пакеты, которые нужны только твоему юзеру
  home.packages = with pkgs; [
    fastfetch
    htop
    alacritty
    slurp
    openssh
    cava
    btop
    grim
  ];

  # Разрешаем нераспространяемый софт (если нужно)
  nixpkgs.config.allowUnfree = true;

  # Включаем Home Manager
  programs.home-manager.enable = true;
}
