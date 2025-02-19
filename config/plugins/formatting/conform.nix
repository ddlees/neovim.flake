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
        lua = [ "stylua" ];
        sh = [ "shfmt" ];
        bash = sh ++ [
          "shellcheck"
          "shellharden"
        ];
        zsh = bash;
      };
      formatters = {
        stylua = { command = lib.getExe pkgs.stylua; };
        shellcheck = { command = lib.getExe pkgs.shellcheck; };
        shellharden = { command = lib.getExe pkgs.shellharden; };
        shfmt = { command = lib.getExe pkgs.shfmt; };
      };
    };
  };
}
