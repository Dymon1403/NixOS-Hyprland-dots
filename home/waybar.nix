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
          font-family: "JetBrainsMono Nerd Font", "Roboto", "Helvetica", "sans-serif";
          font-size: 12px;
          border: none;
          border-radius: 5px;
          min-height: 0;
      }

      window#waybar {
          background: transparent;
      }

      #mpris, #workspaces, #clock, #tray, #cpu, #memory, #temperature {
          font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font Mono", "sans-serif";
          background: rgba(20, 20, 20, 0.7);
          color: @color7;
          border: 2px solid @color4;
          border-radius: 5px;
          padding: 0px 15px;
          margin: 5px 3px;
      }

      #workspaces button {
          padding: 0 12px;
          margin: 4px 4px;
          background-color: rgba(255, 255, 255, 0.05);
          color: @color7;
          border-radius: 5px;
          border: 2px solid transparent;
          transition: all 0.4s cubic-bezier(.55,-0.04,.3,1.44);
      }

      #workspaces button.active {
          background-color: @color4;
          color: @background;
          border: 2px solid @color4;
          min-width: 40px;
      }

      #workspaces button:hover {
          background-color: rgba(255, 255, 255, 0.15);
          box-shadow: inherit;
          text-shadow: inherit;
      }

      #temperature.critical {
          background-color: #f38ba8;
          color: #1e1e2e;
      }

      #battery, #network {
          background-color: rgba(20, 20, 20, 0.7);
          color: @color7;
          border: 2px solid @color4;
          border-radius: 5px;
          padding: 0 15px;
          margin: 4px 10px;
      }

      #battery:hover, #network:hover {
          background-color: @background;
          color: @color7;
      }
    '';
  };
}
