{ lib, pkgs, ... }: {
  extraPackages = with pkgs; [
    statix
  ];

  plugins = {
    # language server
    lsp.servers.nil_ls.enable = true;

    # formatter
    conform-nvim.settings = {
      formatters_by_ft.nix = [ "nixfmt" ];
      formatters.nixfmt.command = lib.getExe pkgs.nixfmt;
    };

    # linter
    lint.lintersByFt.nix = [ "statix" ];
  };
}
