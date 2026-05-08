{ lib, pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    luvit-meta
  ];
  plugins= {
    lsp.servers.lua_ls = {
      enable = true;

      settings = {
        workspace.checkThirdParty = false;
        codeLens.enable = true;
        completion.callSnippet = "Replace";
        doc.privateName = [ "^_" ];
        hint = {
          enable = true;
          setType = false;
          paramType = true;
          paramName = "Disable";
          semicolon = "Disable";
          arrayIndex = "Disable";
        };
      };
    };
    conform-nvim.settings = {
      formatters_by_ft.lua = [ "stylua" ];
      formatters.stylua.command = lib.getExe pkgs.stylua;
    };

    lazydev = {
      enable = true;
      settings.enabled = true;
      settings.library = [
        { path = "\${3rd}luv/library"; words = [ "vim%.uv" ]; }
        { path = "LazyVim"; words = [ "LazyVim" ]; }
        { path = "snacks.nvim"; words = [ "Snacks" ]; }
        { path = "lazy.nvim"; words = [ "LazyVim" ]; }
      ];
    };
  };
}
