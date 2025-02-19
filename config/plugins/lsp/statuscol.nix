{
  plugins.statuscol = {
    enable = true;

    settings = {
      ft_ignore = [
        "dashboard"
        "help"
        "markdown"
        "neo-tree"
        "neotree"
        "text"
      ];
      relculright = true;
      segments = [
        {
          click = "v:lua.ScSa";
          text = [ " %s" ];
        }
        {
          click = "v:lua.ScLa";
          text = [
            {
              __raw = /* lua */ ''
                require('statuscol.builtin').lnumfunc
              '';
            }
            " "
          ];
        }
        {
          click = "v:lua.ScFa";
          text = [
            {
              __raw = /* lua */ ''
                require('statuscol.builtin').foldfunc
              '';
            }
            " "
          ];
        }
      ];
    };
  };
}
