vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {noremap = true, silent = true}

vim.keymap.set("n", "<", "<gv", opt)
vim.keymap.set("n", ">", ">gv", opt)
vim.keymap.set("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
