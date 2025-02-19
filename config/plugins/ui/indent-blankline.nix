{
  plugins.indent-blankline = {
    enable = true;

    settings = {
      indent = {
        char = "|";
        tab_char = "|";
      };
      scope = {
        show_start = false;
        show_end = false;
      };
      exclude = {
        filetypes = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "trouble"
          "notify"
          "toggleterm"
        ];
      };
    };
  };
}
