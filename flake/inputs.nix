{ lib, inputs, self', ... }: {
  options.inputs = lib.mkOption {
    type = lib.types.raw;
    description = "Flake inputs";
    readOnly = true;
  };

  options.tree-sitter = lib.mkOption {
    type = lib.types.package;
    default = self'.tree-sitter-0_26;
    defaultText = lib.literalExpression "pkgs.tree-sitter_0_26";
    description = "The tree-sitter CLI to use.";
  };

  config.inputs = inputs;
}
