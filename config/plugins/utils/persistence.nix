{
  plugins.persistence = {
    enable = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      event = "BufReadPre";

      keys = [
        {
          __unkeyed-1 = "<leader>qs";
          __unkeyed-2.__raw = ''function()
            require("persistence").load()
          end'';
          desc = "Restore Session";
        }
        {
          __unkeyed-1 = "<leader>qS";
          __unkeyed-2.__raw = ''function()
            require("persistence").select()
          end'';
          desc = "Select Session";
        }
        {
          __unkeyed-1 = "<leader>ql";
          __unkeyed-2.__raw = ''function()
            require("persistence").load({ last = true })
          end'';
          desc = "Restore Last Session";
        }
        {
          __unkeyed-1 = "<leader>qd";
          __unkeyed-2.__raw = ''function()
            require("persistence").stop()
          end'';
          desc = "Don't Save Current Session";
        }
      ];
    };
  };
}
