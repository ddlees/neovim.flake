{ lib, pkgs, ... }: {
  plugins= {
    bacon.enable = true;
    conform-nvim.settings.formatters_by_ft.rust = ["rustfmt"];
    rustaceanvim = {
      enable = true;
      settings.server = {
        dap.adapters.lldb = {
          type = "server";
          port = "${''$''}{port}";
          executable = {
            command = "codelldb";
            args = ["--port" "${''$''}{port}"];
          };
        };

        defaultSettings = {
          rust-analyzer = {
            cargo.allFeatures = true;
            check.command = "clippy";
            files.exclude = [
              ".cargo"
              ".direnv"
              ".git"
              ".github"
              "target"
            ];
          };
        };

        tools.enable_clippy = true;
      };
    };
  };
}

