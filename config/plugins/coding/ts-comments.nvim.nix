{
  plugins.ts-comments = {
    enable = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      lazy = true;
      after = /*lua*/ ''function()
        require("ts-comments").setup()
      end'';
    };
  };
}

