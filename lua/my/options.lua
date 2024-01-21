vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.smartcase = true

vim.opt.showtabline = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "UTF-8"
vim.opt.autoread = true

vim.opt.number = true
vim.opt.relativenumber = true 
vim.opt.numberwidth = 4

vim.opt.updatetime = 100

vim.opt.termguicolors = true
vim.opt.wrap = true

vim.opt.cursorline =  true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.api.nvim_command(':filetype plugin on')
