vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- 缩进
map('n', '<', '<gv', opt)
map('n', '>', '>gv', opt)

-- 
map('n', '<leader>w', '<cmd>bd<CR>', opt)

-- 保存
map('n', '<C-s>', ':w<CR>', opt)

-- nvim-tree
map('n', '<C-m>',
    ':lua require("nvim-tree.api").tree.open()<CR>', opt)

-- bufferline
-- 通过leader键加数字键切换不同的buffer
map('n', '<leader>1',
    '<cmd>lua require("bufferline").go_to(1, true)<CR>', opt)
map('n', '<leader>2',
    '<cmd>lua require("bufferline").go_to(2, true)<CR>', opt)
map('n', '<leader>3',
    '<cmd>lua require("bufferline").go_to(3, true)<CR>', opt)
map('n', '<leader>4',
    '<cmd>lua require("bufferline").go_to(4, true)<CR>', opt)
map('n', '<leader>5',
    '<cmd>lua require("bufferline").go_to(5, true)<CR>', opt)
map('n', '<leader>6',
    '<cmd>lua require("bufferline").go_to(6, true)<CR>', opt)
map('n', '<leader>7',
    '<cmd>lua require("bufferline").go_to(7, true)<CR>', opt)
map('n', '<leader>8',
    '<cmd>lua require("bufferline").go_to(8, true)<CR>', opt)
map('n', '<leader>9',
    '<cmd>lua require("bufferline").go_to(9, true)<CR>', opt)
