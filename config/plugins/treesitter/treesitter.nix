{
  plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = false;
      highlight.enable = true;
      indent.enable = true;
      folds.enable = true;
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
