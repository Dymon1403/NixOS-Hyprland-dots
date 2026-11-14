{ ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        margin-top = 2;
        margin-left = 10;
        margin-right = 10;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "mpris" "clock" ];
        modules-right = [ "tray" "temperature" "cpu" "battery" "network" ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };

        clock = {
          format = "  {:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        tray = {
          spacing = 10;
        };

        cpu = {
          format = " {usage}%";
          interval = 2;
        };

        temperature = {
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = [ "" "" "" ];
        };

        mpris = {
          format = "{artist} - {title}";
          format-paused = "<i>{artist} - {title}</i>";
          max-length = 50;
          ellipsis = "...";
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          on-scroll-up = "playerctl next";
          on-scroll-down = "playerctl previous";
        };

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "  {ifname}";
          format-linked = "  {ifname} (No IP)";
          format-disconnected = "  Disconnected";
          tooltip-format = "{ifname} via {gwaddr} ";
          on-click = "nm-connection-editor";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          tooltip-format = "{timeTo} remaining";
        };
      }
    ];

        style = ''
      * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 12px;
          border: none;
          border-radius: 5px;
          min-height: 0;
      }

      window#waybar {
          background: transparent;
      }

      #mpris, #workspaces, #clock, #tray, #cpu, #memory, #temperature {
          font-family: "JetBrainsMono Nerd Font";
          background: alpha(@base00, 0.7); 
          color: @base05; /* Основной текст */
          border: 2px solid @base0D; /* Акцентный цвет для рамки */
          border-radius: 5px;
          padding: 0px 15px;
          margin: 5px 3px;
      }

      #workspaces button {
          padding: 0 10px;
          margin: 4px 3px;
          background-color: transparent; /* Убираем фон у неактивных */
          color: @base05; /* Текст неактивных */
          border-radius: 5px;
          border: 2px solid transparent;
          transition: all 0.4s cubic-bezier(.55,-0.04,.3,1.44);
      }

      #workspaces button.active {
          background-color: @base05; /* Белый фон (или @base0D для акцента) */
          color: @base00; /* Черный текст */
          border: 2px solid @base05;
          min-width: 30px; 
      }

      #workspaces button:hover {
          background-color: alpha(@base05, 0.2); /* Легкий фон при наведении */
          box-shadow: inherit;
          text-shadow: inherit;
      }

      #temperature.critical {
          background-color: @base08; /* Красный из Stylix */
          color: @base00;
      }

      #battery, #network {
          background-color: alpha(@base00, 0.7);
          color: @base05;
          border: 2px solid @base0D;
          border-radius: 5px;
          padding: 0 15px;
          margin: 4px 10px;
      }

      #battery:hover, #network:hover {
          background-color: @base01;
          color: @base05;
      }
    '';
  };
}
