require('dap-python').setup('/usr/bin/python3.11')

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set('n', '<leader>dl', dap.continue)
vim.keymap.set('n', '<leader>dq', dap.terminate)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
