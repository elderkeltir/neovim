require('diffview').setup()

local neogit = require('neogit')
neogit.setup {}

vim.keymap.set('n', '<leader>og', vim.cmd.Neogit)
vim.keymap.set('n', '<leader>odo', vim.cmd.DiffviewOpen)
vim.keymap.set('n', '<leader>odc', vim.cmd.DiffviewClose)

