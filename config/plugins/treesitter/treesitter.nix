{ pkgs, ...}: {
  extraPackages = [
    (pkgs.tree-sitter.overrideAttrs (old: rec {
      version = "0.26.6";
      src = pkgs.fetchFromGitHub {
        owner = "tree-sitter";
        repo = "tree-sitter";
        rev = "v${version}";
        hash = "sha256-ZtzwhEmNZg5brghKNiTRZSmY8FwQeWcemY2blq9j2GM=";
        fetchSubmodules = true;
      };

      nativeBuildInputs = old.nativeBuildInputs ++ [
        pkgs.llvmPackages.libclang.lib
        pkgs.clang
      ];

      LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";

      patches = [
        (pkgs.substitute {
          src = ./remove-web-interface.patch;
        })
      ];
      cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
        inherit src;
        hash = "sha256-u6RmwNR4QVwyuij5RlHTLC5lNNQpWMVrlQwfwF78pYc=";
      };
    }))
  ];

  plugins.treesitter = {
    enable = true;

    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
    settings = {
      auto_install = false;
      highlight.enable = true;
      indent.enable = true;
      folds.enable = true;
    };
  };

  keymaps = [
    {
      key = "<c-space>";
      action = "";
      options.desc = "Increment Selection";
    }
    {
      key = "<bs>";
      action = "";
      mode = ["x"];
      options.desc = "Decrement Selection";
    }
  ];
}
