{
  plugins.todo-comments = {
    enable = true;
  };

  keymaps = [
    {
      key = "]t";
      action.__raw = /* lua */ ''
        function()
          require("todo-comments").jump_next()
        end
      '';
      options.desc = "Next TODO Comment";
    }
    {
      key = "[t";
      action.__raw = /* lua */ ''
        function()
          require("todo-comments").jump_prev()
        end
      '';
      options.desc = "Previous TODO Comment";
    }
    {
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options.desc = "TODO";
    }
    {
      key = "<leader>st";
      action = "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>";
      options.desc = "TODO/FIX/FIXME";
    }
  ];
}
