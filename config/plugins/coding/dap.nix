{
  plugins = {
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
    dap.signs = {
      dapBreakpoint = { text = " "; texthl = "DapBreakpoint"; };
      dapBreakpointCondition = { text = " "; texthl = "DapBreakpointCondition"; };
      dapBreakpointRejected = { text = " "; texthl = "DapBreakpointRejected"; };
      dapLogPoint = { text = " "; texthl = "DapLogPoint"; };
      dapStopped = { text = " "; texthl = "DapStopped"; };
    };
  };

  keymaps = [
    { key = "<leader>dB"; action.__raw = ''function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end''; options.desc = "Breakpoint Condition"; }
    { key = "<leader>db"; action.__raw = ''function() require("dap").toggle_breakpoint() end''; options.desc = "Toggle Breakpoint"; }
    { key = "<leader>dc"; action.__raw = ''function() require("dap").continue() end''; options.desc = "Run/Continue"; }
    { key = "<leader>dC"; action.__raw = ''function() require("dap").run_to_cursor() end''; options.desc = "Run to Cursor"; }
    { key = "<leader>dg"; action.__raw = ''function() require("dap").goto_() end''; options.desc = "Go to Line (No Execute)"; }
    { key = "<leader>di"; action.__raw = ''function() require("dap").step_into() end''; options.desc = "Step Into"; }
    { key = "<leader>dj"; action.__raw = ''function() require("dap").down() end''; options.desc = "Down"; }
    { key = "<leader>dk"; action.__raw = ''function() require("dap").up() end''; options.desc = "Up"; }
    { key = "<leader>dl"; action.__raw = ''function() require("dap").run_last() end''; options.desc = "Run Last"; }
    { key = "<leader>do"; action.__raw = ''function() require("dap").step_out() end''; options.desc = "Step Out"; }
    { key = "<leader>dO"; action.__raw = ''function() require("dap").step_over() end''; options.desc = "Step Over"; }
    { key = "<leader>dP"; action.__raw = ''function() require("dap").pause() end''; options.desc = "Pause"; }
    { key = "<leader>dr"; action.__raw = ''function() require("dap").repl.toggle() end''; options.desc = "Toggle REPL"; }
    { key = "<leader>ds"; action.__raw = ''function() require("dap").session() end''; options.desc = "Session"; }
    { key = "<leader>dt"; action.__raw = ''function() require("dap").terminate() end''; options.desc = "Terminate"; }
    { key = "<leader>dw"; action.__raw = ''function() require("dap.ui.widgets").hover() end''; options.desc = "Widgets"; }
    { key = "<leader>du"; action.__raw = ''function() require("dapui").toggle({}) end''; options.desc = "Dap UI"; }
    { key = "<leader>de"; mode = [ "n" "v" ]; action.__raw = ''function() require("dapui").eval() end''; options.desc = "Eval"; }
  ];

  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end
  '';
}
