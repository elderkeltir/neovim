require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"thirdParty"}
    }
}

require('telescope').load_extension('bookmarks')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('v', '<leader>fs', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', {})
vim.keymap.set('n', '<leader>fm', "<cmd>Telescope bookmarks list<CR>", {})
