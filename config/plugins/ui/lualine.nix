{
  plugins.lualine = {
    enable = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      event = "DeferredUIEnter";
      keys = [];
      beforeAll = /*lua*/ ''function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
          vim.o.statusline = " "
        else
          vim.o.laststatus = 0
        end
      end'';

      before = /*lua*/ ''function()
        require("lz.n").trigger_load("dap")
        require("lz.n").trigger_load("noice")
        require("lz.n").trigger_load("snacks")
      end'';

      after = /*lua*/ ''function()
        local lualine_require = require("lualine_require")
        lualine_require.require = require
        vim.o.laststatus = vim.g.lualine_laststatus
        local icons = {
          Error = " ",
          Warn  = " ",
          Info  = " ",
          Hint  = " ",
          Added = " ",
          Modified = " ",
          Removed = " ",
        }

        require("lualine").setup({
          options = {
            theme = "auto",
            globalstatus = vim.o.laststatus == 3,
            disabled_filetypes = {
              statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
            }
          },

          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = {
              {
                "diagnostics",
                symbols = {
                  error = icons.Error,
                  warn = icons.Warn,
                  info = icons.Info,
                  hint = icons.Hint,
                },
              },
              { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0, }, },
              { "filename" },
            },

            lualine_x = {
              Snacks.profiler.status(),
              {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                color = function() return { fg = Snacks.util.color("Statement") } end,
              },
              {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                color = function() return { fg = Snacks.util.color("Constant") } end,
              },
              {
                function() return "  " .. require("dap").status() end,
                cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              },
              {
                "diff",
                symbols = {
                  added = icons.Added,
                  modified = icons.Modified,
                  removed = icons.Removed,
                },
                source = function()
                  local gitsigns = vim.b.gitsigns_status_dict
                  if gitsigns then
                    return {
                      added = gitsigns.added,
                      modified = gitsigns.changed,
                      removed = gitsigns.removed,
                    }
                  end
                end,
              },
            },
            lualine_y = {
              { "progress", separator = " ", padding = { left = 1, right = 0, }, },
              { "location", padding = { left = 0, right = 1, }, },
            },
            lualine_z = {
              function()
                return " " .. os.date("%R")
              end,
            },
          },
          extensions = { "neo-tree", "fzf" },
        })
      end'';
    };
  };
}
