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
    alacritty
    bibata-cursors
    pywal16
    grim
    slurp
    wl-clipboard

    # ============================================
    # System / CLI
    # ============================================

    fastfetch
    btop
    tree
    fd
    ripgrep
    curl
    wget
    unzip
    gh
    tailscale
    localsend

    # ============================================
    # Media
    # ============================================

    mpv
    ncmpcpp
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
