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

  networking.hostName = "thinkpad";

  networking.networkmanager.enable = true;

    
  # ============================================
  # Thinkfan
  # ============================================
  
  boot.extraModprobeConfig = ''
    options thinkpad_acpi fan_control=1
  '';

  services.thinkfan = {
    enable = true;
    # Используем встроенный интерфейс ThinkPad ACPI для управления кулером
    sensors = [
      {
        type = "tpacpi";
        query = "/proc/acpi/ibm/thermal";
      }
    ];
    levels = [
      [ 0  0  55 ]
      [ 1  48 62 ]
      [ 2  58 68 ]
      [ 3  63 74 ]
      [ 7  70 82 ]
      [ "level auto" 80 32767 ]
    ];
  };
  
  
  # ============================================
  # Throttled
  # ============================================

  services.throttled.enable = true;
  services.power-profiles-daemon.enable = false;

  # ============================================
  # Ssh
  # ============================================

  services.openssh.enable = true;
   
  

  # ============================================
  # thermald
  # ============================================
  
  services.thermald.enable = true;

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

  users.users.dmitrj = {
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
  # Graph for Graph
  # ============================================
  
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };

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
