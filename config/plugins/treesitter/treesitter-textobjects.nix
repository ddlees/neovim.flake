{
  plugins.treesitter-textobjects = {
    enable = true;

    move = {
      enable = true;
      set_jumps = true;

      gotoNextStart = { "]f" = "@function.outer"; "]c" = "@class.outer"; "]a" = "@parameter.inner"; };
      gotoNextEnd = { "]F" = "@function.outer"; "]C" = "@class.outer"; "]A" = "@parameter.inner"; };
      gotoPreviousStart = { "[f" = "@function.outer"; "[c" = "@class.outer"; "[a" = "@parameter.inner"; };
      gotoPreviousEnd = { "[F" = "@function.outer"; "[C" = "@class.outer"; "[A" = "@parameter.inner"; };
    };
  };
  autoCmd = [
    {
      event = [ "FileType" ];
      group = "treesitter_textobjects";
      callback.__raw = ''
        function(ev)
          attach(ev.buf)
        end
      '';
    }
  ];
}
