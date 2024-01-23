local lsp_installer = {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
        require("mason").setup{
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    end,
}

return lsp_installer
