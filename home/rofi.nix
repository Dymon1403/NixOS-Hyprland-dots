{ pkgs, config, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  c = config.lib.stylix.colors; # Сокращаем для удобства
in
{
  stylix.targets.rofi.enable = false;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.alacritty}/bin/alacritty";

    extraConfig = {
      modi = "run,drun";
      font = "Noto Sans Mono Bold 10";
      drun-display-format = "{name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = false;
    };

    theme = {
      "*" = {
        bg-col = mkLiteral "#${c.base00}";
        fg-col = mkLiteral "#${c.base05}";
        fg-col2 = mkLiteral "#${c.base0D}";
        selected-col = mkLiteral "#${c.base02}";
        border-col = mkLiteral "#${c.base0D}";
        
        # Основной фон (без прозрачности, чтобы не ломать парсер)
        background-color = mkLiteral "#${c.base00}";
        text-color = mkLiteral "@fg-col";
        border = "0";
      };

      "window" = {
        width = "500px";
        location = "center";
        anchor = "center";
        padding = "0";
        border = "0";
        border-radius = "12px";
        # Прозрачность через 8-значный hex (последние 2 цифры — alpha)
        # E6 ≈ 90% непрозрачности. Для большей прозрачности используй CC или B3.
        background-color = mkLiteral "#${c.base00}E6"; 
      };


      };
    };
  }
