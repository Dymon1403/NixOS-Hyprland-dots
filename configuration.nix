{ config, pkgs, ... }:

{
  # ============================================
  # Boot
  # ============================================
  # maybe all go fine
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ============================================
  # Network
  # ============================================

  networking.hostName = "YOURNAME";

  networking.networkmanager.enable = true;

  # ============================================
  # Ssh
  # ============================================

  services.openssh.enable = true;  

  # ============================================
  # Locale / Time
  # ============================================

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";


  i18n.extraLocaleSettings = {
    LC_TIME = "ru_RU.UTF-8";
  
  };

  
  # ============================================
  # Keyboard
  # ============================================

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:caps_toggle,caps:shift_capslock";
  };


  # ============================================
  # User
  # ============================================

  users.users.#SETYOURUSER = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "input"
      "docker"
  ];

    shell = pkgs.bash;
  };


  # ============================================
  # Firmware
  # ============================================

  hardware.enableRedistributableFirmware = true;


  # ============================================
  # Login manager
  # ============================================

  services.displayManager.ly.enable = true;


  # ============================================
  # Hyprland
  # ============================================

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


  # ============================================
  # XDG portals
  # ============================================

  xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  
  # --------------------------------------------
  # Cursor
  # --------------------------------------------

  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
  };
  

  
  # --------------------------------------------
  # Font in system
  # --------------------------------------------
 
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
  };

  # ============================================
  # Sound
  # ============================================

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
  };

  security.rtkit.enable = true;


  # ============================================
  # Packages
  # ============================================

  environment.systemPackages = with pkgs; [

    # --------------------------------------------
    # System
    # --------------------------------------------

    git
    neovim

    wget
    curl

    htop
    fastfetch

    unzip

    # --------------------------------------------
    # Terminal, alactirry best terminal ever lollll
    # --------------------------------------------

    alacritty
    starship


    # --------------------------------------------
    # Desktop
    # --------------------------------------------
    
    waybar

    # --------------------------------------------
    # Hyprland utilities
    # --------------------------------------------

    grim
    slurp
    wl-clipboard

    brightnessctl


    # --------------------------------------------
    # Wallpaper
    # --------------------------------------------

    waypaper
    awww


    # --------------------------------------------
    # Audio
    # --------------------------------------------

    pulsemixer

    mpd
    mpc
    mpd-mpris
    playerctl
    ncmpcpp 
    
    # --------------------------------------------
    # Cursor
    # --------------------------------------------
    
    bibata-cursors

    # --------------------------------------------
    # Applications
    # --------------------------------------------
    
    telegram-desktop
    rofi
    firefox
    nautilus  

  ];
    

    # --------------------------------------------
    # Fonts
    # --------------------------------------------
  fonts.packages = with pkgs; [  
    material-design-icons
    font-awesome
    nerd-fonts.jetbrains-mono
  ];


  # ============================================
  # Fonts
  # ============================================

  fonts.fontconfig.enable = true;


  # ============================================
  # Nix
  # ============================================

  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # ============================================
  # NixOS version
  # ============================================

  system.stateVersion = "26.05";
}
