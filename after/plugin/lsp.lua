local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    --lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}

    --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

    --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.cmd.ClangdSwitchSourceHeader)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>os', vim.lsp.buf.document_symbol, opts)
    vim.keymap.set('n', '<leader>cR', vim.lsp.buf.rename, opts)
    --    vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>cp', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>cn', vim.diagnostic.goto_next, opts)
    --vim.keymap.set('n', '<leader>cdq', vim.diagnostic.setloclist, opts)

    -- telescope floats
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
    vim.keymap.set('n', '<leader>cm', builtin.lsp_document_symbols, opts)
    vim.keymap.set('n', '<leader>ps', builtin.lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set('n', '<leader>cd', function() builtin.diagnostics({layout_strategy='center',layout_config={width=0.9}}) end, {buffer=0, remap = false})
    vim.keymap.set('n', '<leader>ci', builtin.lsp_implementations, opts)

    -- these are for checking
    vim.keymap.set("n", "<leader>ch", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ck", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    -- need go to symbol in doc
    -- go to symbol in project
    -- 

end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
--lsp.setup_servers({'pyright'})

require'lspconfig'.pyright.setup{}
require'lspconfig'.autotools_ls.setup{}
require'lspconfig'.clangd.setup{}
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- cmp
local cmp = require("cmp")

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})


lsp.setup()
