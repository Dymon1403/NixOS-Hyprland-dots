{ pkgs, ... }:

{
  home.packages = with pkgs; [
    
    # ============================================
    # Desktop / Wayland
    # ============================================

    waybar
    awww
    waypaper
    rofi
    bibata-cursors
    pywal16
    grim
    slurp
    wl-clipboard
    zathura 
    alacritty 
    fastfetch

    # ============================================
    # System / CLI
    # ============================================

    btop
    tree
    fd
    ripgrep
    curl
    wget
    unzip
    tailscale
    localsend

    # ============================================
    # Media
    # ============================================

    mpv
    cava
    ffmpeg

    # ============================================
    # Dev / Creative
    # ============================================

     (python3.withPackages (ps: with ps; [
      openai-whisper
      python-mpd2
      sounddevice
      numpy
      aiogram
    ]))
    

    sunvox

    # ============================================
    # File Manager
    # ============================================

    kdePackages.dolphin

    # ============================================
    # Apps / Web
    # ============================================

    firefox
    telegram-desktop
    discord

    # ============================================
    # Games
    # ============================================

    steam
    portablemc

  ];
}
