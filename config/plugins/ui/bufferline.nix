let
  bufremove.__raw = /* lua */ ''
    function(buf)
      buf = buf or 0
      buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

      if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 0 or choice == 3 then
          return
        end

        if choice == 1 then
          vim.cmd.write()
        end
      end

      for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.api.nvim_win_call(win, function()
          if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
            return
          end

          local alt = vim.fn.bufnr("#")
          if alt ~= buf and vim.fn.buflisted(alt) == 1 then
            vim.api.nvim_win_set_buf(win, alt)
            return
          end

          local has_previous = pcall(vim.cmd, "bprevious")
          if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
            return
          end

          local new_buf = vim.api.nvim_create_buf(true, false)
          vim.api.nvim_win_set_buf(win, new_buf)
        end)
      end
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.cmd, "bdelete! " .. buf)
      end
    end
  '';
in
{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        close_command = bufremove;
        right_mouse_command = bufremove;
        diagnostics = "nvim_lsp";
        always_show_bufferline = false;
      };
    };
  };

  keymaps = [
    {
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options.desc = "Toggle Pin";
    }
    {
      key = "<leader>bP";
      action = "<cmd>BufferLineGroupClose ungrouped<cr>";
      options.desc = "Close Non-Pinned Buffers";
    }
    {
      key = "<leader>bP";
      action = "<cmd>BufferLineCloseRight<cr>";
      options.desc = "Close Buffers to the Right";
    }
    {
      key = "<leader>bP";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options.desc = "Close Buffers to the Left";
    }
    {
      key = "<s-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Previous Buffer";
    }
    {
      key = "<s-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Previous Buffer";
    }
    {
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "[B";
      action = "<cmd>BufferLineMovePrev<cr>";
      options.desc = "Move Buffer Left";
    }
    {
      key = "]B";
      action = "<cmd>BufferLineMoveNext<cr>";
      options.desc = "Move Buffer Right";
    }
  ];
}
