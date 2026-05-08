{ pkgs, ...}:
{
  plugins.snacks = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings = {
      lazy = false;
      keys = [
        {
          __unkeyed-1 = "<leader>fe";
          __unkeyed-2.__raw = ''function()
            Snacks.explorer()
          end'';
          desc = "Explorer";
        }
        {
          __unkeyed-1 = "<leader>e";
          __unkeyed-2 = "<leader>fe";
          desc = "Explorer";
          remap = true;
        }
        {
          __unkeyed-1 = "<leader>n";
          __unkeyed-2.__raw = ''
            function()
              if Snacks.config.picker and Snacks.config.picker.enabled then
                Snacks.picker.notifications()
              else
                Snacks.notifier.show_history()
              end
            end
          '';
          desc = "Notification History";
        }
        {
          __unkeyed-1 = "<leader>un";
          __unkeyed-2.__raw = ''function() Snacks.notifier.hide() end'';
          desc = "Dismiss All Notifications";
        }
        {
          __unkeyed-1 = "<leader>.";
          __unkeyed-2.__raw = ''function() Snacks.scratch() end'';
          desc = "Toggle Scratch Buffer";
        }
        {
          __unkeyed-1 = "<leader>S";
          __unkeyed-2.__raw = ''function() Snacks.scratch.select() end'';
          desc = "Select Scratch Buffer";
        }
        {
          __unkeyed-1 = "<leader>dps";
          __unkeyed-2.__raw = ''function() Snacks.profiler.scratch() end'';
          desc = "Profiler Scratch Buffer";
        }
      ];

      beforeAll = /*lua*/ ''function()
        vim.g.snacks_animate = true
      end'';

      after = /*lua*/ ''function()
        local function term_nav(dir)
          return function(self)
            return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
              vim.cmd.wincmd(dir)
            end)
          end
        end

        require("snacks").setup({
          explorer = {},
          indent = { enabled = true },
          input = { enabled = true },
          notifier = { enabled = true },
          scope = { enabled = true },
          scroll = { enabled = true },
          statuscolumn = { enabled = false },
          words = { enabled = true },
          bigfile = { enabled = true },
          quickfile = { enabled = true },
          terminal = {
            win = {
              keys = {
                nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
                nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
                nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
                nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
              }
            }
          },

          dashboard = {
            width = 80,
            preset = {
              header = [[
 ██████   █████ █████ █████ █████ █████   █████ █████ ██████   ██████
░░██████ ░░███ ░░███ ░░███ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████ 
 ░███░███ ░███  ░███  ░░███ ███   ░███    ░███  ░███  ░███░█████░███ 
 ░███░░███░███  ░███   ░░█████    ░███    ░███  ░███  ░███░░███ ░███ 
 ░███ ░░██████  ░███    ███░███   ░░███   ███   ░███  ░███ ░░░  ░███ 
 ░███  ░░█████  ░███   ███ ░░███   ░░░█████░    ░███  ░███      ░███ 
 █████  ░░█████ █████ █████ █████    ░░███      █████ █████     █████
░░░░░    ░░░░░ ░░░░░ ░░░░░ ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░ 
]],
              keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert", },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
              },
            },
            sections = {
              { section = "header" },
              { section = "keys", gap = 1, padding = 1 },
              {
                pane = 2,
                section = "terminal",
                cmd = "${pkgs.dwt1-shell-color-scripts}/bin/colorscript -e fade",
                height = 4,
                padding = 1
              },
              {
                pane = 2,
                icon = " ",
                desc = "Browse Repo",
                padding = { 1, 2 },
                key = "b",
                action = function()
                  Snacks.gitbrowse()
                end,
                enabled = Snacks.git.get_root() ~= nil,
              },
              {
                pane = 2,
                section = "terminal",
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
                icon = " ",
                title = "Open Issues",
                cmd = "${pkgs.gh}/bin/gh issue list -L 3",
                action = function()
                  vim.fn.jobstart("${pkgs.gh}/bin/gh issue list --web", { detatch = true })
                end,
                key = "i",
                enabled = Snacks.git.get_root() ~= nil,
                height = 5
              },
              {
                pane = 2,
                section = "terminal",
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
                icon = " ",
                title = "Open PRs",
                cmd = "${pkgs.gh}/bin/gh pr list -L 3",
                action = function()
                  vim.fn.jobstart("${pkgs.gh}/bin/gh pr list --web", { detatch = true })
                end,
                key = "P",
                enabled = Snacks.git.get_root() ~= nil,
                height = 5,
              },
              {
                pane = 2,
                section = "terminal",
                enabled = Snacks.git.get_root() ~= nil,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
                icon = " ",
                title = "Git Status",
                cmd = "${pkgs.git}/bin/git --no-pager diff --stat -B -M -C",
                height = 5,
              },
            }
          }
        })
      end'';
    };
  };
}
