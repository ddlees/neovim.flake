{
  plugins.treesitter-textobjects = {
    enable = true;

    move = {
      enable = true;
      gotoNextStart = { "]f" = "@function.outer"; "]c" = "@class.outer"; "]a" = "@parameter.inner"; };
      gotoNextEnd = { "]F" = "@function.outer"; "]C" = "@class.outer"; "]A" = "@parameter.inner"; };
      gotoPreviousStart = { "[f" = "@function.outer"; "[c" = "@class.outer"; "[a" = "@parameter.inner"; };
      gotoPreviousEnd = { "[F" = "@function.outer"; "[C" = "@class.outer"; "[A" = "@parameter.inner"; };
    };
  };
}
