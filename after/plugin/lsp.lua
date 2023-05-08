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
    vim.keymap.set('n', '<space>cR', vim.lsp.buf.rename, opts)
    --    vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, opts)
    --vim.keymap.set('n', '<leader>cdp', vim.diagnostic.goto_prev, opts)
    --vim.keymap.set('n', '<leader>cdn', vim.diagnostic.goto_next, opts)
    --vim.keymap.set('n', '<leader>cdq', vim.diagnostic.setloclist, opts)

    -- telescope floats
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
    vim.keymap.set('n', '<leader>cs', builtin.lsp_document_symbols, opts)
    vim.keymap.set('n', '<leader>ps', builtin.lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set('n', '<leader>cd', builtin.diagnostics, {buffer=0, remap = false})
    vim.keymap.set('n', '<leader>pe', builtin.diagnostics, opts)
    vim.keymap.set('n', '<leader>ci', builtin.lsp_implementations, opts)

    -- these are for checking
    vim.keymap.set("n", "<leader>ck", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ch", function() vim.lsp.buf.signature_help() end, opts)
    -- need go to symbol in doc
    -- go to symbol in project
    -- 

end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'clangd', 'lua_ls', 'cmake'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
