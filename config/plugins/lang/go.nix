{ lib, pkgs, ...}: {

  extraPackages = with pkgs; [
    go
    gopls
    gofumpt
    golangci-lint
    delve
  ];

  plugins = {
    lsp.servers.gopls = {
      enable = true;

      settings.gopls = {
        gofumpt = true;
        experimentalPostfixCompletions = true;
        codelenses = {
          gc_details = true;
          generate = true;
          regenerate_cgo = true;
          run_govulncheck = true;
          test = true;
          tidy = true;
          upgrade_dependency = true;
          vendor = true;
        };

        hints = {
          assignVariableTypes = true;
          compositeLiteralFields = true;
          compositeLiteralTypes = true;
          constantValues = true;
          functionTypeParameters = true;
          parameterNames = true;
          rangeVariableTypes = true;
        };

        analyses = {
          nilness = true;
          unusedparams = true;
          unusedvariable = true;
          unusedwrite = true;
          useany = true;
          shadow = true;
        };

        hoverKind = "Structured";
        usePlaceholders = true;
        completeUnimported = true;
        staticcheck = true;
        directoryFilters = [
          "-.git"
          "-.vscode"
          "-.idea"
          "-.vscode-test"
          "-node_modules"
        ];
        vulncheck = "Imports";
        semanticTokens = true;
      };
    };

    none-ls = {
      enable = true;

      sources = {
        code_actions = {
          gomodifytags.enable = true;
          impl.enable = true;
        };
      };
    };

    conform-nvim.settings = {
      formatters_by_ft.go = [ "goimports" "gofumpt" ];
      formatters = {
        goimports.command = lib.getExe' pkgs.gotools "goimports";
        gofumpt.command = lib.getExe pkgs.gofumpt;
      };
    };

    lint = {
      lintersByFt.go = ["golangcilint"];
      linters.golangcilint.cmd = lib.getExe pkgs.golangci-lint;
    };

    dap.enable = true;
    dap-go = {
      enable = true;
      settings.delve.path = lib.getExe pkgs.delve;
    };

    neotest = {
      enable = true;
      adapters.golang = {
        enable = true;
        settings.go_test_args.__raw = /* lua */ ''
          {
            "-v",
            "-race",
            "-count=1",
            "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
          }
        '';
      };
    };

    mini.modules.icons = {
      file.".go-version" = {
        glyph = "";
        hl = "MiniIconsBlue";
      };
      filetype.gotmpl = {
        glyph = "󰟓";
        hl = "MiniIconsGray";
      };
    };
  };

  # TODO: load these when in golang context
  keymaps = [
    { key = "<leader>dT"; action.__raw = ''function() require("dap-go").debug_test() end''; options.desc = "Debug Go Test"; }
    { key = "<leader>dL"; action.__raw = ''function() require("dap-go").debug_last_test() end''; options.desc = "Debug Last Go Test"; }
  ];
}
