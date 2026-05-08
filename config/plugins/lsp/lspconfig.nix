{
  plugins.lsp = {
    enable = true;
    capabilities = /*lua*/ ''
      capabilities.workspace.fileOperations = {
        didRename = true,
        willRename = true,
      }
    '';

    inlayHints = true;

    luaConfig.pre = ''
      require("lz.n").trigger_load("snacks")
    '';

    keymaps.extra = [
      {
        key = "<leader>cl";
        action.__raw = ''function() Snacks.picker.lsp_config() end'';
        options.desc = "LSP Info";
      }
      {
        key = "gd";
        action.__raw = ''vim.lsp.buf.definition'';
        options.desc = "Go to Definition";
      }
      {
        key = "gr";
        action.__raw = ''vim.lsp.buf.references'';
        options.desc = "References";
        options.nowait = true;
      }
      {
        key = "gI";
        action.__raw = ''vim.lsp.buf.implementation'';
        options.desc = "Go to Implementation";
      }
      {
        key = "gy";
        action.__raw = ''vim.lsp.buf.type_definition'';
        options.desc = "Go to T[y]pe Definition";
      }
      {
        key = "gD";
        action.__raw = ''vim.lsp.buf.declaration'';
        options.desc = "Go to Declaration";
      }
      {
        key = "K";
        action.__raw = ''function() vim.lsp.buf.hover() end'';
        options.desc = "Hover";
      }
      {
        key = "gK";
        action.__raw = ''function() vim.lsp.buf.signature_help() end'';
        options.desc = "Signature Help";
      }
      {
        key = "<c-k>";
        action.__raw = ''function() vim.lsp.buf.signature_help() end'';
        options.desc = "Signature Help";
        mode = "i";
      }
      {
        key = "<leader>ca";
        action.__raw = ''vim.lsp.buf.code_action'';
        options.desc = "Code Action";
        mode = [ "n" "x" ];
      }
      {
        key = "<leader>cc";
        action.__raw = ''vim.lsp.codelens.run'';
        options.desc = "Run Codelens";
        mode = [ "n" "x" ];
      }
      {
        key = "<leader>cC";
        action.__raw = ''vim.lsp.codelens.refresh'';
        options.desc = "Refresh & Display Codelens";
      }
      {
        key = "<leader>cR";
        action.__raw = ''function() Snacks.rename.rename_file() end'';
        options.desc = "Rename File";
      }
      {
        key = "<leader>cr";
        action.__raw = ''vim.lsp.buf.rename'';
        options.desc = "Rename";
      }
      {
        key = "]]";
        action.__raw = ''function() Snacks.words.jump(vim.v.count1) end'';
        options.desc = "Next Reference";
      }
      {
        key = "[[";
        action.__raw = ''function() Snacks.words.jump(-vim.v.count1) end'';
        options.desc = "Prev Reference";
      }
      {
        key = "<a-n>";
        action.__raw = ''function() Snacks.words.jump(vim.v.count1) end'';
        options.desc = "Next Reference";
      }
      {
        key = "<a-p>";
        action.__raw = ''function() Snacks.words.jump(-vim.v.count1) end'';
        options.desc = "Prev Reference";
      }
    ];
  };
}
