{
  plugins.noice = {
    enable = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      event = "DeferredUIEnter";
      keys = [
        {
          __unkeyed-1 = "<leader>bp";
          __unkeyed-2 = "<cmd>BufferLineTogglePin<cr>";
          desc = "Toggle Pin";
        }

        {
          __unkeyed-1 = "<leader>sn";
          __unkeyed-2 = "";
          desc = "+noice";
        }
        {
          __unkeyed-1 = "<s-enter>";
          __unkeyed-2.__raw = ''function() require("noice").redirect(vim.fn.getcmdline()) end'';
          mode = ["c"];
          desc = "Redirect Cmdline";
        }
        {
          __unkeyed-1 = "<leader>snl";
          __unkeyed-2.__raw = ''function() require("noice").cmd("last") end'';
          desc = "Noice Last Message";
        }
        {
          __unkeyed-1 = "<leader>snh";
          __unkeyed-2.__raw = ''function() require("noice").cmd("history") end'';
          desc = "Noice History";
        }
        {
          __unkeyed-1 = "<leader>sna";
          __unkeyed-2.__raw = ''function() require("noice").cmd("all") end'';
          desc = "Noice All";
        }
        {
          __unkeyed-1 = "<leader>snd";
          __unkeyed-2.__raw = ''function() require("noice").cmd("dismiss") end'';
          desc = "Dismiss All";
        }
        {
          __unkeyed-1 = "<leader>snt";
          __unkeyed-2.__raw = ''function() require("noice").cmd("pick") end'';
          desc = "Noice Picker (Telescope/FzfLua)";
        }
        {
          __unkeyed-1 = "<c-f>";
          __unkeyed-2.__raw = ''function()
            if not require("noice.lsp").scroll(4) then
              return "<c-f>";
            end
          end'';
          mode = ["i" "n" "s"];
          desc = "Scroll Forward";
          expr = true;
          silent = true;
        }
        {
          __unkeyed-1 = "<c-b>";
          __unkeyed-2.__raw = ''function()
            if not require("noice.lsp").scroll(-4) then
              return "<c-b>";
            end
          end'';
          mode = ["i" "n" "s"];
          desc = "Scroll Backward";
          expr = true;
          silent = true;
        }
      ];

      after = /*lua*/ ''function()
        require("noice").setup({
          lsp = {
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            }
          },
          routes = {
            {
              filter = {
                event = "msg_show",
                any = {
                  { find = "%d+L, %d+B" },
                  { find = "; after #%d+" },
                  { find = "; before #%d+" },
                },
              },
              view = "mini",
            },
          },
          presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
          },
        })
      end'';
    };
  };
}
