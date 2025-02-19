{
  plugins.neo-tree = {
    enable = true;

    filesystem = {
      bindToCwd = false;
      useLibuvFileWatcher = true;
      followCurrentFile.enabled = true;
    };

    defaultComponentConfigs = {
      container.enableCharacterFade = true;
      indent = {
        indentSize = 2;
        padding = 1;
        withMarkers = true;
        indentMarker = "│";
        lastIndentMarker = "└";
        highlight = "NeoTreeIndentMarker";
        withExpanders = false;
        expanderCollapsed = "";
        expanderExpanded = "";
        expanderHighlight = "NeoTreeExpander";
      };
      gitStatus.symbols = {
        unstaged = "";
        staged = "";
        renamed = "";
        untracked = "󱀶";
        deleted = "";
        ignored = "";
      };

      diagnostics.symbols = {
        hint = "";
        info = "";
        warn = "";
        error = "";
      };
    };

    usePopupsForInput = false;
    popupBorderStyle = "rounded";
    # sourceSelector.winbar = true;
    extraSources = [ "document_symbols" ];
    window = {
      autoExpandWidth = true;
    };
  };

  plugins.bufferline.settings.options.offsets = [
    { filetype = "neo-tree"; text = "Explorer"; highlight = "PanelHeading"; padding = 1; }
  ];

  autoCmd = [{
    event = [ "FileType" ];
    pattern = [ "neo-tree" "neotree" ];
    desc = "Disable UFO/folding for neo-tree";
    callback.__raw = /* lua */ ''
      function(event)
        ufo = require('ufo')
        ufo.detach(event.buf)
      end
    '';
  }];

  keymaps = [
    {
      key = "<leader>fe";
      action.__raw = /* lua */ ''
        function()
          require("neo-tree.command").execute({ toggle = true })
        end
      '';
      options.desc = "Explorer NeoTree (Root Dir)";
    }
    {
      key = "<leader>fE";
      action.__raw = /* lua */ ''
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end
      '';
      options.desc = "Explorer NeoTree (cwd)";
    }
    {
      key = "<leader>e";
      action = "<leader>fe";
      options = {
        desc = "Explorer NeoTree (Root Dir)";
        remap = true;
      };
    }
    {
      key = "<leader>E";
      action = "<leader>fE";
      options = {
        desc = "Explorer NeoTree (cwd)";
        remap = true;
      };
    }
    {
      key = "<leader>ge";
      action.__raw = /* lua */ ''
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end
      '';
      options.desc = "Git Explorer";
    }
    {
      key = "<leader>be";
      action.__raw = /* lua */ ''
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end
      '';
      options.desc = "Git Explorer";
    }
  ];
}
