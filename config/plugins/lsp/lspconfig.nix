{
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      luaConfig.post = {
        codelens.enabled = false;
        folds.enabled = true;
        format = {
          formatting_options = null;
          timeout_ms = null;
        };
      };
      capabilities = ''
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      '';
    };

    lspconfig = {
      enable = true;
    };
  };

  diagnostic = {
    underline = true;
    update_in_insert = false;
    virtual_text = {
      spacing = 4;
      source = "if_many";
      prefix = "●";
    };
    severity_sort = true;
  };
}
