vim.g.loaded_netrw = 1

require "plugins"

require "plugins-config.nvim-tree"
require "plugins-config.lualine"

require "my.options"
require "my.keybinding"

vim.cmd.colorscheme "gruvbox"
