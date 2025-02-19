{
  plugins.which-key = {
    enable = true;

    settings = {
      preset = "helix";
      spec = [
        {
          mode = ["n" "v"];
          __unkeyed-1 = [{__unkeyed-1 = "<leader><tab>"; group = "tabs";}];
          __unkeyed-2 = [{__unkeyed-1 = "<leader>c"; group = "code";}];
          __unkeyed-3 = [{__unkeyed-1 = "<leader>d"; group = "debug";}];
          __unkeyed-4 = [{__unkeyed-1 = "<leader>dp"; group = "profiler";}];
          __unkeyed-5 = [{__unkeyed-1 = "<leader>f"; group = "file/find";}];
          __unkeyed-6 = [{__unkeyed-1 = "<leader>g"; group = "git";}];
          __unkeyed-7 = [{__unkeyed-1 = "<leader>gh"; group = "hunks";}];
          __unkeyed-8 = [{__unkeyed-1 = "<leader>q"; group = "quit/session";}];
          __unkeyed-9 = [{__unkeyed-1 = "<leader>s"; group = "search";}];
          __unkeyed-10 = [{__unkeyed-1 = "<leader>u"; group = "ui"; icon = { icon = "󰙵 "; color = "cyan"; };}];
          __unkeyed-11 = [{__unkeyed-1 = "<leader>x"; group = "diagnostics/quickfix"; icon = { icon = "󱖫 "; color = "green"; };}];
          __unkeyed-12 = [{__unkeyed-1 = "["; group = "prev";}];
          __unkeyed-13 = [{__unkeyed-1 = "]"; group = "next";}];
          __unkeyed-14 = [{__unkeyed-1 = "g"; group = "goto";}];
          __unkeyed-15 = [{__unkeyed-1 = "gs"; group = "surround";}];
          __unkeyed-16 = [{__unkeyed-1 = "z"; group = "fold";}];
          __unkeyed-17 = [{
            __unkeyed-1 = "<leader>b";
            group = "buffer";
            expand.__raw = /* lua */ ''
              function()
                return require("which-key.extras").expand.buf()
              end
            ''; 
          }];
          __unkeyed-18 = [{
            __unkeyed-1 = "<leader>w";
            group = "windows";
            proxy = "<c-w>";
            expand.__raw = /* lua */ ''
              function()
                return require("which-key.extras").expand.win()
              end
            ''; 
          }];
          __unkeyed-19 = [{__unkeyed-1 = "gx"; desc = "Open with system app";}];
        }
      ];
    };
  };

  keymaps = [
    {
      key = "<leader>?";
      action.__raw = /* lua */ ''
        function()
          require("which-key").show({ global = false })
        end
      '';
      options.desc = "Buffer Keymaps (which-key)";
    }
    {
      key = "<c-w><space>";
      action.__raw = /* lua */ ''
        function()
          require("which-key").show({ keys = "<c-w>", loop = true })
        end
      '';
      options.desc = "Window Hydra Mode (which-key)";
    }
  ];
}
