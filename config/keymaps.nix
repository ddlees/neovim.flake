{
  keymaps = [
    # better up/down
    {
      key = "j";
      mode = [ "n" "x" ];
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
    }
    {
      key = "<down>";
      mode = [ "n" "x" ];
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
    }
    {
      key = "k";
      mode = [ "n" "x" ];
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
    }
    {
      key = "<up>";
      mode = [ "n" "x" ];
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
    }

    # Move to window using <ctrl> hjkl keys
    {
      key = "<c-h>";
      mode = [ "n" ];
      action = "<c-w>h";
      options = {
        desc = "Go to Left Window";
        remap = true;
      };
    }
    {
      key = "<c-j>";
      mode = [ "n" ];
      action = "<c-w>j";
      options = {
        desc = "Go to Lower Window";
        remap = true;
      };
    }
    {
      key = "<c-k>";
      mode = [ "n" ];
      action = "<c-w>k";
      options = {
        desc = "Go to Upper Window";
        remap = true;
      };
    }
    {
      key = "<c-l>";
      mode = [ "n" ];
      action = "<c-w>l";
      options = {
        desc = "Go to Right Window";
        remap = true;
      };
    }

    # Resize window using <ctrl> arrow keys
    {
      key = "<c-up>";
      mode = [ "n" ];
      action = "<cmd>resize +2<cr>";
      options = {
        desc = "Increase Window Height";
      };
    }
    {
      key = "<c-down>";
      mode = [ "n" ];
      action = "<cmd>resize -2<cr>";
      options = {
        desc = "Decrease Window Height";
      };
    }
    {
      key = "<c-left>";
      mode = [ "n" ];
      action = "<cmd>vertical resize -2<cr>";
      options = {
        desc = "Decrease Window Width";
      };
    }
    {
      key = "<c-right>";
      mode = [ "n" ];
      action = "<cmd>vertical resize +2<cr>";
      options = {
        desc = "Increase Window Width";
      };
    }

    # Move lines
    {
      key = "<a-j>";
      mode = [ "n" ];
      action = "<cmd>execute 'move .+' . v:count1<cr>";
      options = {
        desc = "Move Down";
      };
    }
    {
      key = "<a-k>";
      mode = [ "n" ];
      action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>";
      options = {
        desc = "Move Up";
      };
    }
    {
      key = "<a-j>";
      mode = [ "i" ];
      action = "<esc><cmd>m .+1<cr>==gi";
      options = {
        desc = "Move Down";
      };
    }
    {
      key = "<a-k>";
      mode = [ "i" ];
      action = "<esc><cmd>m .-2<cr>==gi";
      options = {
        desc = "Move Up";
      };
    }
    {
      key = "<a-j>";
      mode = [ "v" ];
      action = ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv";
      options = {
        desc = "Move Down";
      };
    }
    {
      key = "<a-k>";
      mode = [ "v" ];
      action = ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
      options = {
        desc = "Move Up";
      };
    }
    
    # buffers
    {
      key = "<s-h>";
      mode = [ "n" ];
      action = "<cmd>bprevious<cr>";
      options = {
        desc = "Previous Buffer";
      };
    }
    {
      key = "<s-l>";
      mode = [ "n" ];
      action = "<cmd>bnext<cr>";
      options = {
        desc = "Next Buffer";
      };
    }
    {
      key = "[b";
      mode = [ "n" ];
      action = "<cmd>bprevious<cr>";
      options = {
        desc = "Previous Buffer";
      };
    }
    {
      key = "]b";
      mode = [ "n" ];
      action = "<cmd>bnext<cr>";
      options = {
        desc = "Next Buffer";
      };
    }
    {
      key = "<leader>bb";
      mode = [ "n" ];
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }
    {
      key = "<leader>`";
      mode = [ "n" ];
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }
    {
      key = "<leader>bD";
      mode = [ "n" ];
      action = "<cmd>:bdcr>";
      options = {
        desc = "Delete Buffer and Window";
      };
    }

    # Clear search, diff update and redraw
    {
      key = "<leader>ur";
      mode = [ "n" ];
      action = "<cmd>nohlsearch<bar>diffupdate<bar>normal! <c-L><cr>";
      options = {
        desc = "Redraw / Clear hlsearch / Diff Update";
      };
    }

    # n and N should always search in the right direction
    {
      key = "n";
      mode = ["n"];
      action = "'Nn'[v:searchForward].'zv'";
      options = {
        desc = "Next Search Result";
        expr = true;
      };
    }
    {
      key = "n";
      mode = [ "o" "x"];
      action = "'Nn'[v:searchForward]";
      options = {
        desc = "Next Search Result";
        expr = true;
      };
    }
    {
      key = "N";
      mode = ["n"];
      action = "'nN'[v:searchForward].'zv'";
      options = {
        desc = "Previous Search Result";
        expr = true;
      };
    }
    {
      key = "N";
      mode = [ "o" "x"];
      action = "'nN'[v:searchForward]";
      options = {
        desc = "Previous Search Result";
        expr = true;
      };
    }

    # Add undo break-points
    {
      key = ",";
      mode = [ "i" ];
      action = ",<c-g>u";
    }
    {
      key = ".";
      mode = [ "i" ];
      action = ".<c-g>u";
    }
    {
      key = ";";
      mode = [ "i" ];
      action = ";<c-g>u";
    }

    # save file
    {
      key = "<c-s>";
      mode = ["i" "x" "n" "s"];
      action = "<cmd>w<cr><esc>";
      options.desc = "Save File";
    }

    # keywordprg
    {
      key = "<leader>K";
      mode = [ "n" ];
      action = "<cmd>norm! K<cr>";
      options.desc = "Keywordprg";
    }

    # better indenting
    {
      key = "<";
      mode = ["v"];
      action = "<gv";
    }
    {
      key = ">";
      mode = ["v"];
      action = ">gv";
    }

    # comments
    {
      key = "gco";
      mode = [ "n" ];
      action = "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options.desc = "Add Comment Below";
    }
    {
      key = "gcO";
      mode = [ "n" ];
      action = "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options.desc = "Add Comment Above";
    }

    # new file
    {
      key = "<leader>fn";
      mode = [ "n" ];
      action = "<cmd>enew<cr>";
      options.desc = "New File";
    }

    # location list
    {
      key = "<leader>xl";
      mode = [ "n" ];
      action.__raw = /* lua */ ''
        function()
          local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
          if not success and err then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      '';
      options.desc = "Location List";
    }

    # quickfix list
    {
      key = "<leader>xq";
      mode = [ "n" ];
      action.__raw = /* lua */ ''
        function()
          local success, err = pcall(vim.fn.getqflist(0, { winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
          if not success and err then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      '';
      options.desc = "Quickfix List";
    }
    {
      key = "[q";
      mode = ["n"];
      action.__raw = ''vim.cmd.cprev'';
      options.desc = "Previous Quickfix";
    }
    {
      key = "]q";
      mode = ["n"];
      action.__raw = ''vim.cmd.cnext'';
      options.desc = "Next Quickfix";
    }

    # diagnostics
    {
      key = "<leader>cd";
      mode = ["n"];
      action.__raw = ''vim.diagnostic.open_float'';
      options.desc = "Line Diagnostics";
    }
    {
      key = "]d";
      mode = ["n"];
      action.__raw = ''vim.diagnostic.goto_next'';
      options.desc = "Next Diagnostic";
    }
    {
      key = "[d";
      mode = ["n"];
      action.__raw = ''vim.diagnostic.goto_prev'';
      options.desc = "Previous Diagnostic";
    }
    {
      key = "]e";
      mode = ["n"];
      action.__raw = ''function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity["ERROR"] }) end'';
      options.desc = "Next Error";
    }
    {
      key = "[e";
      mode = ["n"];
      action.__raw = ''function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity["ERROR"] }) end'';
      options.desc = "Previous Error";
    }
    {
      key = "]w";
      mode = ["n"];
      action.__raw = ''function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity["WARN"] }) end'';
      options.desc = "Next Warning";
    }
    {
      key = "[w";
      mode = ["n"];
      action.__raw = ''function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity["WARN"] }) end'';
      options.desc = "Previous Warning";
    }

    # easy quit
    {
      key = "<leader>qq";
      mode = [ "n" ];
      action = "<cmd>qa<cr>";
      options.desc = "Quit All";
    }

    # highlights under cursor
    {
      key = "<leader>ui";
      mode = [ "n" ];
      action.__raw = "vim.show_pos";
      options.desc = "Inspect Position";
    }
    {
      key = "<leader>uI";
      mode = [ "n" ];
      action = "<cmd>InspectTree<cr>";
      options.desc = "Inspect Tree";
    }

    # terminal
    {
      key = "<c-/>";
      mode = [ "t" ];
      action = "<cmd>close<cr>";
      options.desc = "Hide Terminal";
    }
    {
      key = "<c-_>";
      mode = [ "t" ];
      action = "<cmd>close<cr>";
      options.desc = "which_key_ignore";
    }

    # windows
    {
      key = "<leader>-";
      mode = [ "n" ];
      action = "<c-w>s";
      options = {
        desc = "Split Window Below";
        remap = true;
      };
    }
    {
      key = "<leader>|";
      mode = [ "n" ];
      action = "<c-w>v";
      options = {
        desc = "Split Window Right";
        remap = true;
      };
    }
    {
      key = "<leader>wd";
      mode = [ "n" ];
      action = "<c-w>c";
      options = {
        desc = "Close Window";
        remap = true;
      };
    }

    # tabs
    {
      key = "<leader><tab>l";
      mode = [ "n" ];
      action = "<cmd>tablast<cr>";
      options.desc = "Last Tab";
    }
    {
      key = "<leader><tab>o";
      mode = [ "n" ];
      action = "<cmd>tabonly<cr>";
      options.desc = "Close Other Tabs";
    }
    {
      key = "<leader><tab>f";
      mode = [ "n" ];
      action = "<cmd>tabfirst<cr>";
      options.desc = "First Tab";
    }
    {
      key = "<leader><tab><tab>";
      mode = [ "n" ];
      action = "<cmd>tabnew<cr>";
      options.desc = "New Tab";
    }
    {
      key = "<leader><tab>]";
      mode = [ "n" ];
      action = "<cmd>tabnext<cr>";
      options.desc = "Next Tab";
    }
    {
      key = "<leader><tab>d";
      mode = [ "n" ];
      action = "<cmd>tabclose<cr>";
      options.desc = "Close Tab";
    }
    {
      key = "<leader><tab>[";
      mode = [ "n" ];
      action = "<cmd>tabprevious<cr>";
      options.desc = "Previous Tab";
    }
  ];
}
