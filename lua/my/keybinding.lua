vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

--------------------------------------------------------------------------------
-- some behaviors when close and save files.

-- close file
map('n', '<leader>q', '<cmd>bd<CR>', opt)
map('n', '<leader><leader>q', '<cmd>bd!<CR>', opt)
-- save file
map('n', '<leader>w', '<cmd>w<CR>', opt)
-- save and quit file
map('n', '<leader><leader>w', '<cmd>w|bd<cr>', opt)
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- terminal
local Terminal  = require('toggleterm.terminal').Terminal

-- lazygit in terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true})
function _lazygit_toggle()
  lazygit:toggle()
end
map('n', '<leader>g', '<cmd>lua _lazygit_toggle()<cr>', opt)

-- cmake in terminal
local source = Terminal:new({
    cmd =   'cmake -S . -B cmake-build -G "Unix Makefiles" '..
            '--no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Debug '..
            '-DCMAKE_TOOLCHAIN_FILE:STRING='..
                'E:/run_time/vcpkg/scripts/buildsystems/vcpkg.cmake '..
            '-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE ',
    hidden = true,
    close_on_exit = false
})
function _cmake_source()
    source:toggle()
end

local clean_source = Terminal:new({
    cmd =   'rm -rf cmake-build && '..
            'cmake -S . -B cmake-build -G "Unix Makefiles" '..
            '--no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Debug '..
            '-DCMAKE_TOOLCHAIN_FILE:STRING='..
                'E:/run_time/vcpkg/scripts/buildsystems/vcpkg.cmake '..
            '-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE ',
    hidden = true,
    close_on_exit = false
})
function _cmake_clean_source()
    clean_source:toggle()
end

local build = Terminal:new({
    cmd = 'cmake --build cmake-build ',
    hidden = true,
    close_on_exit = false
})
function _cmake_build()
    build:toggle()
end

map('n', '<leader>cs', '<cmd>lua _cmake_source()<cr>', opt)
map('n', '<leader>ccs', '<cmd>lua _cmake_clean_source()<cr>' ,opt)
map('n', '<leader>cb', '<cmd>lua _cmake_build()<cr>' ,opt)
--------------------------------------------------------------------------------

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
    vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- set a global func, which is enable in terminal mode
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
