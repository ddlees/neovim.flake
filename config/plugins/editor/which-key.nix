{
  plugins.which-key = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings = {
      event = "DeferredUIEnter";
      keys = [
        {
          __unkeyed-1 = "<leader>?";
          __unkeyed-2.__raw = ''
            function()
              require("which-key").show({ global = false })
            end
          '';
          desc = "Buffer Keymaps (which-key)";
        }
        {
          __unkeyed-1 = "<c-w><space>";
          unkeyed-2.__raw = ''
            function()
              require("which-key").show({ keys = "<c-w>", loop = true })
            end
          '';
          desc = "Window Hydra Mode (which-key)";
        }
      ];

      after = /*lua*/ ''function()
        require("which-key").setup({
          preset = "modern",
          spec = {
            {
              mode = {"n", "x"},
              { "<leader><tab>", group = "tabs" },
              { "<leader>c", group = "code" },
              { "<leader>d", group = "debug" },
              { "<leader>dp", group = "profiler" },
              { "<leader>f", group = "file/find" },
              { "<leader>g", group = "git" },
              { "<leader>gh", group = "hunks" },
              { "<leader>q", group = "quit/session" },
              { "<leader>s", group = "search" },
              { "<leader>u", group = "ui" },
              { "<leader>x", group = "diagnostics/quickfix" },
              { "[", group = "prev" },
              { "]", group = "next" },
              { "g", group = "goto" },
              { "gs", group = "surround" },
              { "z", group = "fold" },
              {
                "<leader>b",
                group = "buffer",
                expand = function()
                  return require("which-key.extras").expand.buf()
                end
              },
              {
                "<leader>w",
                group = "windows",
                proxy = "<c-w>",
                expand = function()
                  return require("which-key.extras").expand.win()
                end
              },
              { "gx", desc = "Open with system app" },
            },
          },
        })
      end'';

      before = /*lua*/ ''function()
        require("lz.n").trigger_load("mini.icons")
        require("lz.n").trigger_load("nvim-web-devicons")
      end'';
    };
  };
}
