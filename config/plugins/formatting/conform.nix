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
      };
      formatters = {
        injected.options.ignore_errors = true;
        shfmt.command = lib.getExe pkgs.shfmt;
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
