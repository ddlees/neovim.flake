{ lib, pkgs, ... }: {
  plugins= {
    crates = {
      enable = true;
      settings = {
        completion.crates.enabled = true;
        lsp = {
          enabled = true;
          actions = true;
          completion = true;
          hover = true;
        };
      };
    };
    lsp.servers.rust_analyzer = {
      enable = true;
    };
    rustaceanvim = {
      enable = true;
      settings.server.defaultSettings.rust-analyzer = {
        cargo = {
          allFeatures = true;
          loadOutDirsFromCheck = true;
          buildScripts.enable = true;
        };
        checkOnSave = true;
        diagnostics.enable = true;
        procMacro.enable = true;
        files = {
          exclude = [
            ".direnv"
            ".git"
            ".jj"
            ".github"
            ".gitlab"
            "bin"
            "node_modules"
            "target"
            "venv"
            ".venv"
          ];
          watcher = "client";
        };
      };
    };
  };
}

