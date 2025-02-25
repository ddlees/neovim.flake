rec {
  autoCmd = [
    {
      event = [ "FocusGained" "TermClose" "TermLeave" ];
      group = "nixvim_checktime";
      desc = "Check for file changes on regaining focus";
      callback.__raw = /* lua */ ''
        function()
          if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
          end
        end
      '';
    }
    {
      event = [ "TextYankPost" ];
      group = "nixvim_highlight_yank";
      desc = "Highlight on Yank";
      callback.__raw = /* lua */ ''
        function()
          (vim.hl or vim.highlight).on_yank()
        end
      '';
    }
    {
      event = [ "VimResized" ];
      group = "nixvim_resize_splits";
      desc = "Resize Splits on Window Resize";
      callback.__raw = /* lua */ ''
        function()
          local current_tab = vim.fn.tabpagenr()
          vim.cmd("tabdo wincmd =")
          vim.cmd("tabnext " .. current_tab)
        end
      '';
    }
    {
      event = [ "BufReadPost" ];
      group = "nixvim_last_loc";
      desc = "Go to Last Location on Opening a Buffer";
      callback.__raw = /* lua */ ''
        function(event)
          local buf = event.buf
          if vim.tbl_contains({ "gitcommit" }, vim.bo[buf].filetype) or vim.b[buf].nixvim_last_loc then
            return
          end

          vim.b[buf].nixvim_last_loc = true
          local mark = vim.api.nvim_buf_get_mark(buf, '"')
          local count = vim.api.nvim_buf_line_count(buf)
          if mark[1] > 0 and mark[1] < count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
          end
        end
      '';
    }
    {
      event = [ "FileType" ];
      group = "nixvim_close_with_q";
      desc = "Close certain filetypes with <q>";
      pattern = [
        "PlenaryTestPopup"
        "checkhealth"
        "dbout"
        "gitsigns-blame"
        "grug-far"
        "help"
        "lspinfo"
        "neotest-output"
        "neotest-output-panel"
        "neotest-summary"
        "notify"
        "qf"
        "spectre_panel"
        "startuptime"
        "tsplayground"
      ];
      callback.__raw = /* lua */ ''
        function(event)
          vim.bo[event.buf].buflisted = false
          vim.schedule(function()
            vim.keymap.set("n", "q", function()
              vim.cmd("close")
              pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit Buffer",
              })
          end)
        end
      '';
    }
    {
      event = [ "FileType" ];
      group = "nixvim_man_unlisted";
      pattern = [ "man_unlisted" ];
      desc = "Close man-files more easily when opened inline";
      callback.__raw = /* lua */ ''
        function(event)
          vim.bo[event.buf].buflisted = false
        end
      '';
    }
    {
      event = [ "FileType" ];
      group = "nixvim_wrap_spell";
      pattern = [
        "text"
        "plaintex"
        "typst"
        "gitcommit"
        "markdown"
      ];
      desc = "Wrap and check for spelling in text filetypes";
      callback.__raw = /* lua */ ''
        function(event)
          vim.opt_local.wrap = true
          vim.opt_local.spell = true
        end
      '';
    }
    {
      event = [ "FileType" ];
      group = "nixvim_json_conceal";
      pattern = [
        "json"
        "jsonc"
        "json5"
      ];
      desc = "Fix conceallevel for json files";
      callback.__raw = /* lua */ ''
        function(event)
          vim.opt_local.conceallevel = 0
        end
      '';
    }
    {
      event = [ "BufWritePre" ];
      group = "nixvim_auto_create_dir";
      desc = "Auto create dir when saving a file that is missing intermediate directories";
      callback.__raw = /* lua */ ''
        function(event)
          if event.match:match("^%w%w+:[\\/][\\/]") then
            return
          end
          local file = vim.uv.fs_realpath(event.match) or event.match
          vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        end
      '';
    }
  ];

  autoGroups = builtins.foldl' (acc: elem: { "${elem.group}" = { clear = true; }; } // acc) {} autoCmd;
}
