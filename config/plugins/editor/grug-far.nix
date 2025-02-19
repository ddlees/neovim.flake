{
  plugins.grug-far = {
    enable = true;

    settings.headerMaxWidth = 80;
  };
  keymaps = [
    {
      key = "<leader>sr";
      mode = ["n" "v"];
      action.__raw = /* lua */ ''
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
      options.desc = "Search and Replace";
    }
  ];
}
