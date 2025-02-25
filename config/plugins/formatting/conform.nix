{lib, pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;

    settings = {
      default_format_opts = {
        timeout_ms = 3000;
        async = false;
        quiet = false;
        lsp_format = "fallback";
      };
      formatters_by_ft = rec {
        sh = [ "shfmt" ];
        bash = sh ++ [
          "shellcheck"
          "shellharden"
        ];
        zsh = bash;
      };
      formatters = {
        shellcheck = { command = lib.getExe pkgs.shellcheck; };
        shellharden = { command = lib.getExe pkgs.shellharden; };
        shfmt = { command = lib.getExe pkgs.shfmt; };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>cF";
      mode = [ "n" "v" ];
      action.__raw = /* lua */ ''
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end
      '';
      options.desc = "Format Injected Languages";
    }
  ];
}
