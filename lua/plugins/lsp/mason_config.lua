local mason_config = {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
        require("mason-lspconfig").setup{}
    end,
}

return mason_config 
