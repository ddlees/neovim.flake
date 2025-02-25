{
  # Import all your configuration modules here
  imports = [ 
    ./autocmds.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  viAlias = true;
  vimAlias = true;
  withPython3 = true;
  withNodeJs = true;
  withRuby = true;
}
