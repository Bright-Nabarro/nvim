local dap = require('dap')

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "gdb",
        request = "launch",
        program = function()
		  local executable = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		  
		  if executable == '' then
		    print("Error: No executable provided, aborting.")
		    return nil -- 退出并返回空值
		  end
		  
		  return executable
		end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
            return vim.split(vim.fn.input('Arguments: '), ' ')
        end,
        runInTerminal = true,
    }
}

dap.configurations.c = dap.configurations.cpp

-- 自动打开/关闭 nvim-dap-ui
local dapui = require("dapui")
dapui.setup();

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()
