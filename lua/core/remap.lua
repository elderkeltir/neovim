local custom = require("core.custom")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>oe", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>Y", "viwy")
vim.keymap.set({"n", "v"}, "<leader>P", "viwp")
vim.keymap.set("n", "<leader>y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>kr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>ks", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>ka", "<cmd>wa<CR>")
vim.keymap.set("n", "<leader>kq", "<cmd>qa<CR>")

--check this one
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>kk", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>kj", "<cmd>lprev<CR>zz")

vim.keymap.set('n', '<leader>pc', custom.cmake_cofigure(), {silent = false})
vim.keymap.set('n', '<leader>pb', custom.cmake_build(), {silent = false})
vim.keymap.set('n', '<leader>pr', custom.cmake_clean(), {silent = false})
vim.keymap.set('n', '<leader>pm', custom.make_build(), {silent = false})
vim.keymap.set('n', '<leader>pp', custom.make_standard_build(), {silent = true})

-- window
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wc", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>wd", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>cclose<CR>")

vim.keymap.set("n", "zs", "z=")
vim.keymap.set("n", "zn", "]s")
vim.keymap.set("n", "zp", "[s")
