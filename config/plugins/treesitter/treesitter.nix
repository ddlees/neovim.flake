{
  plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = false;
      parser_install_dir.__raw = ''vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')'';
      highlight = { enable = true; };
      indent = { enable = true; };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<c-space>";
          node_incremental = "<c-space>";
          scope_incremental = false;
          node_decremental = "<bs>";
        };
      };
    };
  };

  keymaps = [
    {
      key = "<c-space>";
      action = "";
      options.desc = "Increment Selection";
    }
    {
      key = "<bs>";
      action = "";
      mode = ["x"];
      options.desc = "Decrement Selection";
    }
  ];
}
