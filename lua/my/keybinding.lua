vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- 关闭窗口
map('n', '<leader>w', '<cmd>bd<CR>', opt)
map('n', '<leader><leader>w', '<cmd>q!<CR>', opt)

-- 保存
map('n', '<C-s>', '<cmd>w<CR>', opt)

-- 左右分割窗口
map('n', '<leader>v', '<cmd>vs<CR>', opt)

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

-- terminal
map('n', '<leader>t', '<cmd>ToggleTerm<CR>', opt)
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    -- 当按下下列方向键切换到特定位置的窗口
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- 设置一个全局函数，当进入终端模式时才会进行映射
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
