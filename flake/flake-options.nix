{ lib, inputs, ... }: {

  # Options declared here are evaluated during flake-parts evaluation and are separate from editor options exposed to consumers.
  options.inputs = lib.mkOption {
    type = lib.types.raw;
    description = "Flake inputs";
    readOnly = true;
  };

  config.inputs = inputs;
}
