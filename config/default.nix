{
  # Import all your configuration modules here
  imports = [ 
    ./plugins
    ./colorscheme.nix
    ./options.nix
  ];

  viAlias = true;
  vimAlias = true;
  withPython3 = true;
  withNodeJs = true;
  withRuby = true;
}
