{
  plugins.grug-far = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings = {
      cmd = [ "GrugFar" "GrugFarWithin" ];
      keys = [
        {
          __unkeyed-1 = "<leader>sr";
          __unkeyed-2.__raw = ''
            function()
              local grug = require("grug-far")
              local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
              grug.open({
                transient = true,
                prefills = {
                  filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                },
              })
            end
          '';
          mode = ["n" "v"];
          desc = "Search and Replace";
        }
      ];
      after = /*lua*/ ''function()
        require("grug-far").setup({
          headerMaxWidth = 80,
        })
      end'';
    };
  };
}
