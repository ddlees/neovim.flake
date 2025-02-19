{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        theme = "auto";
        globalstatus.__raw = /* lua */ ''vim.o.laststatus == 3'';
        disabled_filetypes = {
          statusline = [ "dashboard" "alpha" "ministarter" ];
        };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [
          { __unkeyed-1 = "diagnostics"; }
          { __unkeyed-1 = "filetype"; icon_only = true; separator = ""; padding = { left = 1; right = 0; }; }
          { __unkeyed-1 = "filename"; }
          {
            __unkeyed-1.__raw = /* lua */ ''
              function()
                local trouble = require("trouble")
                local symbols = trouble.statusline({
                  mode = "symbols",
                  groups = {},
                  title = false,
                  filter = { range = true },
                  format = "{kind_icon}{symbol.name:Normal}",
                  hl_group = "lualine_c_normal",
                })
                return symbols.get()
              end
            '';
            cond.__raw = /* lua */ ''
              function()
                return vim.g.trouble_lualine and vim.b.trouble_lualine ~= false and require("trouble").statusline({
                  mode = "symbols",
                  groups = {},
                  title = false,
                  filter = { range = true },
                  format = "{kind_icon}{symbol.name:Normal}",
                  hl_group = "lualine_c_normal",
                }).has()
              end
            '';
          }
        ];

        lualine_x = [
          {
            __unkeyed-1.__raw = /* lua */ ''function() return require("noice").api.status.command.get() end'';
            cond.__raw = /* lua */ ''function() return package.loaded["noice"] and require("noice").api.status.command.has() end'';
          }
          {
            __unkeyed-1.__raw = /* lua */ ''function() return require("noice").api.status.mode.get() end'';
            cond.__raw = /* lua */ ''function() return package.loaded["noice"] and require("noice").api.status.mode.has() end'';
          }
          {
            __unkeyed-1.__raw = /* lua */ ''function() return "  " .. require("dap").status() end'';
            cond.__raw = /* lua */ ''function() return package.loaded["dap"] and require("dap").status() ~= "" end'';
          }
          {
            __unkeyed-1 = "diff";
            source.__raw = /* lua */ ''
              function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end
            '';
          }
        ];
        lualine_y = [
          { __unkeyed-1 = "progress"; separator = " "; padding = { left = 1; right = 0; }; }
          { __unkeyed-1 = "location"; padding = { left = 0; right = 1; }; }
        ];
        lualine_z = [
          { __unkeyed-1.__raw = /* lua */ ''
              function()
                return " " .. os.date("%R")
              end
            '';
          }
        ];
      };
      extensions = [ "neo-tree" ];
    };
  };
}
