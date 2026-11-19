{ ... }: {
  # These run during flake-parts evaluation
  imports = [
    ./flake-options.nix
    ./nixvim.nix
  ];
}
