vim.g.mapleader = " "

map = vim.api.nvim_set_keymap
opt = {noremap = true, silent = true}

-- 缩进
map('n', '<', '<gv', opt)
map('n', '>', '>gv', opt)

-- 保存
map('n', '<C-s>', ':w<CR>', opt)

-- nvim-tree
map('n', '<C-m>', ':lua require("nvim-tree.api").tree.open()<CR>', opt)
