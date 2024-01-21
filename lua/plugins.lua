local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", 
        "clone", 
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
 
require("lazy").setup(
    {
        -- theme
        {
            "morhetz/gruvbox",
        }
        -- nvim-tree
        {
            "kyazdani42/nvim-tree.lua",
            event = 'VimEnter',
            dependencies = "nvim-tree/nvim-web-devicons"
        },

        -- lualine
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            }
        },
    }
)
