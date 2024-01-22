opt = {noremap = true, silent = true}
map = vim.api.nvim_set_keymap

-- 缩进
vim.api.nvim_set_keymap('n', '<', '<gv', opt)
vim.api.nvim_set_keymap('n', '>', '>gv', opt)

-- nvim-tree
map('n', '<C-m>',
    ':lua require("nvim-tree.api").tree.toggle()<CR>',opt)