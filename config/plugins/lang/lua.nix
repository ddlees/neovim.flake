{ lib, pkgs, ... }: {
  plugins.lsp.servers.lua_ls = {
    enable = true;

    extraOptions.on_init.__raw = ''function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT",
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          },
        },
      })
    end'';
    settings = {
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
      workspace.checkThirdParty = false;
    };
  };
  plugins.conform-nvim.settings = {
    formatters_by_ft.lua = [ "stylua" ];
    formatters.stylua.command = lib.getExe pkgs.stylua;
  };
  plugins.lazydev.enable = true;
}
