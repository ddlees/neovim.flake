{
  plugins.lsp = {
    enable = true;

    inlayHints = true;
  };

  diagnostics = {
    underline = true;
    virtual_text = false;
    severity_sort = true;
    signs = true;
    float = {
      border = "rounded";
      source = "always";
      focusable = false;
    };
  };
}
