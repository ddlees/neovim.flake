{
  plugins.nvim-autopairs = {
    enable = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      event = "InsertEnter";
      after = /*lua*/ ''function()
        require("nvim-autopairs").setup()
      end'';
    };
  };
}
