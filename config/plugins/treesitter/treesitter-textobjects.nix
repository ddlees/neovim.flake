{
  plugins.treesitter-textobjects = {
    enable = true;

    settings = {
      move = {
        enable = true;
        set_jumps = true;
        gotoNextStart = { "]f" = "@function.outer"; "]c" = "@class.outer"; "]a" = "@parameter.inner"; };
        gotoNextEnd = { "]F" = "@function.outer"; "]C" = "@class.outer"; "]A" = "@parameter.inner"; };
        gotoPreviousStart = { "[f" = "@function.outer"; "[c" = "@class.outer"; "[a" = "@parameter.inner"; };
        gotoPreviousEnd = { "[F" = "@function.outer"; "[C" = "@class.outer"; "[A" = "@parameter.inner"; };
      };
      lsp_interop = {
        enable = true;
        border = "none";
        floating_preview_opts = {};
        peek_definition_code = {
          "<leader>df" = "@function.outer";
          "<leader>dF" = "@class.outer";
        };
      };
    };
  };
}
