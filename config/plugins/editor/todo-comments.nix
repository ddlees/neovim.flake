{
  plugins.todo-comments = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings = {
      event = ["BufReadPost" "BufNewFile" "BufReadPre"];
      cmd = [ "TodoTrouble" "TodoTelescope" ];
      keys = [
        {
          __unkeyed-1 = "]t";
          __unkeyed-2.__raw = ''function()
            require("todo-comments").jump_next()
          end'';
          desc = "Next TODO Comment";
        }
        {
          __unkeyed-1 = "[t";
          __unkeyed-2.__raw = ''function()
            require("todo-comments").jump_prev()
          end'';
          desc = "Prev TODO Comment";
        }
        {
          __unkeyed-1 = "<leader>xt";
          __unkeyed-2 = "<cmd>Trouble todo toggle<cr>";
          desc = "TODO (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>xT";
          __unkeyed-2 = "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>";
          desc = "TODO/FIX/FIXME (Trouble)";
        }
        {
          __unkeyed-1 = "<leader>st";
          __unkeyed-2 = "<cmd>TodoTelescope<cr>";
          desc = "TODO";
        }
        {
          __unkeyed-1 = "<leader>sT";
          __unkeyed-2 = "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>";
          desc = "TODO/FIX/FIXME";
        }
      ];
    };
  };
}
