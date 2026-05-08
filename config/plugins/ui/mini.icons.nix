{
  plugins.mini-icons = {
    enable = true;
    mockDevIcons = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      lazy = true;
      after = /*lua*/ ''function()
        require("mini.icons").setup({
          file = {
            [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey "},
            ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
          },
          filetype = {
            dotenv = { glyph = "", hl = "MiniIconsYellow" },
          },
        })
        require("mini.icons").mock_nvim_web_devicons()
      end'';
    };
  };
}
