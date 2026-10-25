{ config, pkgs, ... }:

{
  # ============================================
  # Boot
  # ============================================

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
  # Bash_Aliases
  # ============================================

  environment.shellAliases = {

            ls = "ls --color=auto";
            grep = "grep --color=auto";
            bt = "bluetoothctl";
            ff = "fastfetch";
            cm = "cmus";
            home = "ssh dmitrj@192.168.0.228";
            nn = "nvim ~/dot/configuration.nix";
            zap = "./zapret.sh";
            ss = "sudo nixos-rebuild switch --flake .#thinkpad";

            };

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
    enable32Bit = true;
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

    wget
    curl

    htop
    fastfetch

    unzip

  # --------------------------------------------
  # GIT
  # --------------------------------------------

    git

  # --------------------------------------------
  # Terminal, alactirry best terminal ever lollll
  # --------------------------------------------

    starship
    alacritty

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
    pavucontrol
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

    nautilus
    telegram-desktop
    rofi
    firefox

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
  # Zapret
  # ============================================

  services.zapret = {
    enable = true;
    #whitelist = [
     # "rutracker.org"
     # "youtube.com"
     # "discord.com"
     # "discord.gg"
     # "discordapp.com"
     # "discordapp.net"
     # "ciscobinary.openh264.org"

    #];
    configureFirewall = true;
    params = [
       "--dpi-desync=fake,fakedsplit"
       "--dpi-desync-fooling=badseq"
       "--dpi-desync-split-pos=1"
       "--dpi-desync-fake-tls=!"
       "--dpi-desync-fake-tls-mod=rnd,dupsid"


    ];
  };


  # ============================================
  # Bluetooth
  # ============================================

  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };


  # ============================================
  # Tailscale
  # ============================================

  services.tailscale.enable = true;


  # ============================================
  # MPD
  # ============================================

  services.mpd = {
    enable = true;
    musicDirectory = "/home/dmitrj/Music";
    user = "dmitrj";

    settings = {
      bind_to_address = "127.0.0.1";
      port = 6600;
      audio_output = [
        {
          type = "pipewire";
          name = "PipeWire Output";
        }
      ];
    };
  };


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
  # Appimage_in_nix
  # ============================================

  nixpkgs.config.allowUnfree = true;

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  programs.appimage = {
    enable = true;
    binfmt = true;

    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.icu
      ];
    };
  };


  # ============================================
  # NixOS version
  # ============================================

  system.stateVersion = "26.05";
}
