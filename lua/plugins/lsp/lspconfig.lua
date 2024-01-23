local lsp_config = {
    "neovim/nvim-lspconfig",
    config = function()
        -- Set up lspconfig.
        local servers = {'clangd'}
        for _, lsp in ipairs(servers) do
            require("lspconfig")[lsp].setup {
                -- on_attach = my_custom_on_attach,
                capabilities = capabilities,
            }
        end
        require("lspconfig").clangd.setup {}
        require("lspconfig").lua_ls.setup {on_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path..'/.luarc.json') and
            not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force',
                client.config.settings, {
                    Lua = {
                            runtime = {version = 'LuaJIT'},
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME
                                    -- "${3rd}/luv/library"
                                    -- "${3rd}/busted/library", 
                                }
                                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                -- library = vim.api.nvim_get_runtime_file("", true)
                            }
                        }
                    })
                    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
            return true
            end
        }
        require("lspconfig").cmake.setup {
            command = "cmake-language-server",
            filetypes = {"cmake"},
            rootPatterns = {"cmake-build/"},
            initializationOptions = {
                buildDirectory = "cmake-build"
            },
        }
    end
}

return lsp_config
