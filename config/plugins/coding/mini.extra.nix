{
  plugins.mini-extra = {
    enable = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      lazy = true;
      after = /*lua*/ ''function()
        require("mini.extra").setup()
      end'';
    };
  };
}
