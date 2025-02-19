{
  plugins.nvim-ufo = {
    enable = true;

    settings = {
      provider_selector = /* lua */ ''
        function()
          return { "lsp", "indent" }
        end
      '';
      preview.mappings = {
        close = "q";
        switch = "K";
      };
    };
  };
}
