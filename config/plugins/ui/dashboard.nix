{ lib, pkgs, ...}: {
  plugins.lazy.enable = true;
  plugins.snacks = {
    enable = true;

    settings.dashboard = {
      preset = {
        header = ''
          _____  ___    __     ___  ___  ___      ___  __     ___      ___ 
          (\"   \|"  \  |" \   |"  \/"  ||"  \    /"  ||" \   |"  \    /"  |
          |.\\   \    | ||  |   \   \  /  \   \  //  / ||  |   \   \  //   |
          |: \.   \\  | |:  |    \\  \/    \\  \/. ./  |:  |   /\\  \/.    |
          |.  \    \. | |.  |    /\.  \     \.    //   |.  |  |: \.        |
          |    \    \ | /\  |\  /  \   \     \\   /    /\  |\ |.  \    /:  |
           \___|\____\)(__\_|_)|___/\___|     \__/    (__\_|_)|___|\__/|___|
        '';
        keys = [
          { icon = " "; key = "f"; desc = "Find File"; action.__raw = /* lua */ "function() Snacks.dashboard.pick('files') end"; }
          { icon = " "; key = "n"; desc = "New File"; action = ":ene | startinsert"; }
          { icon = " "; key = "g"; desc = "Find Text"; action.__raw = /* lua */ "function() Snacks.dashboard.pick('live_grep') end"; }
          { icon = " "; key = "r"; desc = "Recent Files"; action.__raw = /* lua */ "function() Snacks.dashboard.pick('oldfiles') end"; }
          { icon = " "; key = "c"; desc = "Config"; action.__raw = /* lua */ "function() Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')}) end"; }
          { icon = " "; key = "q"; desc = "Quit"; action = ":qa"; }
        ];
      };
      sections = [
        { section = "header"; }
        { pane = 2;
          section = "terminal";
          height = 5;
          padding = 1;
          cmd = "${pkgs.dwt1-shell-color-scripts}/bin/colorscript -e square";
        }
        { section = "keys"; gap = 1; padding = 1; }
        {
          pane = 2;
          icon = " ";
          desc = "Browse Repo";
          padding = 1;
          key = "b";
          action.__raw = /* lua */ ''
            function()
              Snacks.gitbrowse()
            end
          '';
        }
        { section = "startup"; }
      ];
    };
  };
}
