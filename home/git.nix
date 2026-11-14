{ ... }:

{

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "Dymon1403";
        email = "dymaroxer1403@gmail.com";
      };
        
        url."git@github.com:".insteadOf = "https://github.com/";
      
      
      init.defaultBranch = "main";
    };
  };

}
