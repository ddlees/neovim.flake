{ pkgs, ...}:
let
  inGit.__raw = /* lua */ ''Snacks.git.get_root() ~= nil'';
in {
  plugins.lazy.enable = true;
  plugins.snacks = {
    enable = true;

    settings = {
      indent.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      scope.enabled = true;
      scroll.enabled = true;
      statuscolumn.enabled = false;
      words.enabled = true;
    };
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
        { section = "keys"; gap = 1; padding = 1; }
        {
          pane = 2;
          height = 2;
        }
        {
          pane = 2;
          section = "terminal";
          cmd = "${pkgs.dwt1-shell-color-scripts}/bin/colorscript -e fade";
          height = 4;
          padding = 1;
        }
        {
          pane = 2;
          icon = " ";
          desc = "Browse Repo";
          padding = [ 1 2 ];
          key = "b";
          action.__raw = /* lua */ ''
            function()
              Snacks.gitbrowse()
            end
          '';
          enabled = inGit;
        }
        {
          pane = 2;
          section = "terminal";
          padding = 1;
          ttl = 5 * 60;
          indent = 3;
          icon = " ";
          title = "Open Issues";
          cmd = "${pkgs.gh}/bin/gh issue list -L 3";
          action.__raw = /* lua */ ''function() vim.fn.jobstart("${pkgs.gh}/bin/gh issue list --web", { detatch = true }) end'';
          key = "i";
          enabled = inGit;
          height = 5;
        }
        {
          pane = 2;
          section = "terminal";
          padding = 1;
          ttl = 5 * 60;
          indent = 3;
          icon = " ";
          title = "Open PRs";
          cmd = "${pkgs.gh}/bin/gh pr list -L 3";
          action.__raw = /* lua */ ''function() vim.fn.jobstart("${pkgs.gh}/bin/gh pr list --web", { detatch = true }) end'';
          key = "P";
          enabled = inGit;
          height = 5;
        }
        {
          pane = 2;
          section = "terminal";
          enabled = inGit;
          padding = 1;
          ttl = 5 * 60;
          indent = 3;
          icon = " ";
          title = "Git Status";
          cmd = "${pkgs.git}/bin/git --no-pager diff --stat -B -M -C";
          height = 5;
        }
      ];
    };
    luaConfig.post = ''
      Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
      Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
      Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
      Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
      Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
      Snacks.toggle.option("background", { off = "light", on = "Dark", name = "Dark Background" }):map("<leader>ub")
      Snacks.toggle.diagnostics():map("<leader>ud")
      Snacks.toggle.line_number():map("<leader>ul")
      Snacks.toggle.treesitter():map("<leader>uT")
      Snacks.toggle.dim():map("<leader>uD")
      Snacks.toggle.animate():map("<leader>ua")
      Snacks.toggle.indent():map("<leader>ug")
      Snacks.toggle.scroll():map("<leader>uS")
      Snacks.toggle.profiler():map("<leader>dpp")
      Snacks.toggle.profiler_highlights():map("<leader>dph")
      Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
      Snacks.toggle.zen():map("<leader>uz")

      if vim.lsp.inlay_hint then
        Snacks.toggle.inlay_hints():map("<leader>uh")
      end

    '';
  };

  keymaps = [
    {
      key = "<leader>n";
      action.__raw = /* lua */ ''
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end
      '';
      options.desc = "Notification History";
    }
    {
      key = "<leader>un";
      action.__raw = /* lua */ ''
        function()
          Snacks.notifier.hide()
        end
      '';
      options.desc = "Dismiss All Notifications";
    }
    {
      key = "<leader>bd";
      mode = [ "n" ];
      action.__raw = /* lua */ ''
        function()
          Snacks.bufdelete()
        end
      '';
      options.desc = "Delete Buffer";
    }
    {
      key = "<leader>bo";
      mode = [ "n" ];
      action.__raw = /* lua */ ''
        function()
          Snacks.bufdelete.other()
        end
      '';
      options.desc = "Delete Other Buffers";
    }

    # floating terminal
    {
      key = "<leader>fT";
      mode = [ "n" ];
      action.__raw = /* lua */ ''
        function()
          Snacks.terminal()
        end
      '';
      options.desc = "Terminal (cwd)";
    }
    {
      key = "<leader>ft";
      mode = [ "n" ];
      action.__raw = /* lua */ ''
        function()
          Snacks.terminal(nil, { cwd = LazyVim.root() })
        end
      '';
      options.desc = "Terminal (root)";
    }
  ];
}
