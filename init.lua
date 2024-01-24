-- help nvim-tree
vim.g.loaded_netrw = 1

-- enable lazy.nvim
require("pluginsManager")

-- my config files
require("my.options")
require("my.keybinding")

vim.cmd.colorscheme "gruvbox"
vim.opt.termguicolors = true
