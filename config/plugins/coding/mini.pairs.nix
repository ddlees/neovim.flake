{
  plugins.mini.modules.pairs = {
    markdown = true;
    modes = {
      insert = true;
      command = true;
      terminal = false;
    };
    skip_next.__raw = /* lua */ ''[=[[%w%%%'%[%"%.%`%$]]=]'';
    skip_ts = [ "string" ];
    skip_unbalanced = true;
  };
}
