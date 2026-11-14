{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./waybar.nix
    ./nvim.nix
    ./git.nix
    ./dunst.nix
    ./shell.nix
    ./rofi.nix
  ];


  home.packages = [
    (pkgs.writeShellScriptBin "wake" ''
      exec ${pkgs.python3}/bin/python3 ${../scripts/wake.py} "$@"
    '')
  ];

  home.file = {

    ".local/bin/wal".source = ../scripts/wal.py;
    ".local/bin/wal".executable = true;

    ".local/bin/sleep".source = ../scripts/sleep.py;
    ".local/bin/sleep".executable = true;

    ".local/bin/docker".source = ../scripts/docker.py;
    ".local/bin/docker".executable = true;

    ".local/bin/pi".source = ../scripts/ping.py;
    ".local/bin/pi".executable = true;

  };

  stylix.targets.firefox = {
    enable = true;
    profileNames = [ "6ix" ]; 
  };



  home.username = "dmitrj";
  home.homeDirectory = "/home/dmitrj";
  
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
