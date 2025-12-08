{
  plugins.lspsaga = {
    enable = true;

    lightbulb = {
      enable = false;
      virtualText = false;
    };
    outline.keys.jump = "<cr>";
    ui.border = "rounded";
    scrollPreview = {
      scrollDown = "<c-d>";
      scrollUp = "<c-u>";
    };
    finder.methods = {
      dec = "textDocument/declaration";
      sig = "textDocument/signatureHelp";
      lens = "textDocument/codeLens";
    };
  };

  keymaps = [
    {
      key = "gd";
      action = "<cmd>Lspsaga goto_definition<cr>";
      options.desc = "Go to Definition";
    }
    {
      key = "gr";
      action = "<cmd>Lspsaga finder ref<cr>";
      options.desc = "References";
    }
    {
      key = "gI";
      action = "<cmd>Lspsaga finder imp<cr>";
      options.desc = "Go to Implementation";
    }
    {
      key = "gy";
      action = "<cmd>Lspsaga goto_type_definition<cr>";
      options.desc = "Go to T[y]pe Definition";
    }
    {
      key = "gD";
      action = "<cmd>Lspsaga finder dec<cr>";
      options.desc = "Go to Declaration";
    }
    {
      key = "K";
      action = "<cmd>Lspsaga hover_doc<cr>";
      options.desc = "Hover";
    }
    {
      key = "gK";
      action = "<cmd>Lspsaga finder sig<cr>";
      options.desc = "Signature Help";
    }
    {
      key = "<leader>ca";
      mode = ["n" "v"];
      action = "<cmd>Lspsaga code_action<cr>";
      options.desc = "Code Action";
    }
    {
      key = "<leader>cc";
      mode = ["n" "v"];
      action.__raw = /* lua */ ''vim.lsp.codelens.run'';
      options.desc = "Run Codelens";
    }
    {
      key = "<leader>cC";
      action = "<cmd>Lspsaga finder lens<cr>";
      options.desc = "Refresh & Display Codelens";
    }
    {
      key = "<leader>cr";
      action = "<cmd>Lspsaga rename ++project<cr>";
      options.desc = "Rename";
    }
  ];
}
