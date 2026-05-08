{ inputs, self, ... }: {
  flake.nixvimModules.default = ../config;

  nixvim = {
    packages.enable = true;
    checks.enable = true;
  };

  perSystem = { system, ... }: {
    nixvimConfigurations = {
      default = inputs.nixvim.lib.evalNixvim {
        inherit system;
        modules = [
          self.nixvimModules.default
        ];
      };
    };
  };
}
