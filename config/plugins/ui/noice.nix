{
  plugins.noice = {
    enable = true;

    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
      };
      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              { find = "%d+L, %d+B"; }
              { find = "; after #%d+"; }
              { find = "; before #%d+"; }
            ];
          };
          view = "mini";
        }
      ];
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
      };
    };
  };

  keymaps = [
    {
      key = "<leader>sn";
      action = "";
      options.desc = "+noice";
    }
    {
      key = "<s-enter>";
      mode = ["c"];
      action.__raw = /* lua */ ''
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end
      '';
      options.desc = "Redirect Cmdline";
    }
    {
      key = "<leader>snl";
      action.__raw = /* lua */ ''
        function()
          require("noice").cmd("last")
        end
      '';
      options.desc = "Noice Last Message";
    }
    {
      key = "<leader>snh";
      action.__raw = /* lua */ ''
        function()
          require("noice").cmd("history")
        end
      '';
      options.desc = "Noice History";
    }
    {
      key = "<leader>sna";
      action.__raw = /* lua */ ''
        function()
          require("noice").cmd("all")
        end
      '';
      options.desc = "Noice All";
    }
    {
      key = "<leader>snd";
      action.__raw = /* lua */ ''
        function()
          require("noice").cmd("dismiss")
        end
      '';
      options.desc = "Dismiss All";
    }
    {
      key = "<leader>snt";
      action.__raw = /* lua */ ''
        function()
          require("noice").cmd("pick")
        end
      '';
      options.desc = "Noice Picker (Telescope/FzfLua)";
    }
    {
      key = "<c-f>";
      mode = ["i" "n" "s"];
      action.__raw = /* lua */ ''
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>";
          end
        end
      '';
      options = {
        desc = "Scroll Forward";
        expr = true;
        silent = true;
      };
    }
    {
      key = "<c-b>";
      mode = ["i" "n" "s"];
      action.__raw = /* lua */ ''
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>";
          end
        end
      '';
      options = {
        desc = "Scroll Backward";
        expr = true;
        silent = true;
      };
    }
  ];
}
