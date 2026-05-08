{
  plugins.trouble = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings = {
      cmd = [ "Trouble" ];

      after = /*lua*/ ''function()
        require("trouble").setup({
          modes = {
            lsp = {
              win = { position = "right" },
            },
          },
        })
      end'';

      keys = [
        {
          __unkeyed-1 = "<leader>xx";
          __unkeyed-2 = "<cmd>Trouble diagnostics toggle<cr>";
          desc = "Diagnostics (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>xX";
          __unkeyed-2 = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
          desc = "Buffer Diagnostics (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>cs";
          __unkeyed-2 = "<cmd>Trouble symbols toggle<cr>";
          desc = "Symbols (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>cS";
          __unkeyed-2 = "<cmd>Trouble lsp toggle<cr>";
          desc = "LSP references/definitions/... (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>xL";
          __unkeyed-2 = "<cmd>Trouble loclist toggle<cr>";
          desc = "Location List (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>xQ";
          __unkeyed-2 = "<cmd>Trouble qflist toggle<cr>";
          desc = "Quickfix List (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>xt";
          __unkeyed-2 = "<cmd>Trouble todo toggle<cr>";
          desc = "TODOs (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>xT";
          __unkeyed-2 = "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>";
          desc = "TODO/FIX/FIXME List (Trouble)";
        }
      ];
    };
  };
}
