vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {noremap = true, silent = true}

-- 缩进
vim.keymap.set("n", "<", "<gv", opt)
vim.keymap.set("n", ">", ">gv", opt)

-- nvim-tree
vim.keymap.set("n", "<C-m>", ":NvimTreeToggle", opt)