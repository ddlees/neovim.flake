{
  plugins.bufferline = {
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
          __unkeyed-1 = "<leader>bP";
          __unkeyed-2 = "<cmd>BufferLineGroupClose ungrouped<cr>";
          desc = "Close Non-Pinned Buffers";
        }
        {
          __unkeyed-1 = "<leader>bP";
          __unkeyed-2 = "<cmd>BufferLineCloseRight<cr>";
          desc = "Close Buffers to the Right";
        }
        {
          __unkeyed-1 = "<leader>bP";
          __unkeyed-2 = "<cmd>BufferLineCloseLeft<cr>";
          desc = "Close Buffers to the Left";
        }
        {
          __unkeyed-1 = "<s-h>";
          __unkeyed-2 = "<cmd>BufferLineCyclePrev<cr>";
          desc = "Previous Buffer";
        }
        {
          __unkeyed-1 = "<s-l>";
          __unkeyed-2 = "<cmd>BufferLineCycleNext<cr>";
          desc = "Next Buffer";
        }
        {
          __unkeyed-1 = "[b";
          __unkeyed-2 = "<cmd>BufferLineCyclePrev<cr>";
          desc = "Previous Buffer";
        }
        {
          __unkeyed-1 = "]b";
          __unkeyed-2 = "<cmd>BufferLineCycleNext<cr>";
          desc = "Next Buffer";
        }
        {
          __unkeyed-1 = "[B";
          __unkeyed-2 = "<cmd>BufferLineMovePrev<cr>";
          desc = "Move Buffer Left";
        }
        {
          __unkeyed-1 = "]B";
          __unkeyed-2 = "<cmd>BufferLineMoveNext<cr>";
          desc = "Move Buffer Right";
        }
      ];
      before = /*lua*/ ''function()
        require("lz.n").trigger_load("snacks")
      end'';

      after = /*lua*/ ''function()
        local icons = {
          octo = " ",
          gh = " ",
          ["markdown.gh"] = " ",
        }
        require("bufferline").setup({
          options = {
            close_command = function(n) Snacks.bufdelete(n) end,
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            diagnostics_indicator = function(_, _, diag)
              local icons = {
                Error = " ",
                Warn = " ",
              }
              local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              return vim.trim(ret)
            end,
            offsets = {
              {
                filetype = "neo-tree",
                text = "Neo-tree",
                highlight = "Directory",
                text_align = "left",
              },
              {
                filetype = "snacks_layout_box",
              }
            },
            get_element_icon = function(opts)
              return icons[opts.filetype]
            end,
          }
        })
      end'';
    };
  };
}
