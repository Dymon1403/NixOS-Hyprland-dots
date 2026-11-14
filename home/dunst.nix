{ ... }:

{
  
  services.dunst = {
    enable = true;

    settings = {
      global = {
        format = "<b>%s</b>\\n%b";
        origin = "top-right";
        offset = "10x10";
        width = 300;
        transparency = 10;
        frame_color = "#ffffff";
        frame_width = 2;
        background = "#1a1b26";
        foreground = "#c0caf5";


      };

      urgency_normal = {
        timeout = 10;
      };
    };
  };

}
