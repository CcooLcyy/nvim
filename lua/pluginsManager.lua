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

require("lazy").setup({
    -- appearence
    require("plugins.appearance.theme"),
    require("plugins.appearance.startup"),
    require("plugins.appearance.bufferline"),
    require("plugins.appearance.lualine"),

    -- file browser
    require("plugins.nvim_tree"),

    -- lsp
    require("plugins.lsp.mason_config"),
    require("plugins.lsp.mason"),
    require("plugins.lsp.lspconfig"),

    -- cmp
    require("plugins.cmp.nvim_cmp"),
    require("plugins.cmp.cmp_nvim_lsp"),

    -- snippet
    require("plugins.snippet.cmp_luasnip"),
    require("plugins.snippet.luasnip"),

    -- highlight
    require("plugins.autopair"),

    -- git
    require("plugins.git"),
})
