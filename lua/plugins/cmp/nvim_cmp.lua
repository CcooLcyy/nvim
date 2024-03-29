local nvim_cmp = {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function()
        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        require("cmp").setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },
            window = {
                -- completion = require("cmp").config.window.bordered(),
                -- documentation = require("cmp").config.window.bordered(),
            },
            mapping = require("cmp").mapping.preset.insert({
                ['<C-b>'] = require("cmp").mapping.scroll_docs(-4),
                ['<C-f>'] = require("cmp").mapping.scroll_docs(4),
                ['<C-Space>'] = require("cmp").mapping.complete(),
                ['<C-e>'] = require("cmp").mapping.abort(),
                -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<CR>'] = require("cmp").mapping.confirm({ select = true }),
                ["<Tab>"] = require("cmp").mapping(function(fallback)
                    if require("cmp").visible() then
                        require("cmp").select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        require("luasnip").expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            sources = require("cmp").config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                { name = 'buffer' },
            })
        })

          -- Set configuration for specific filetype.
        -- require("cmp").setup.filetype('gitcommit', {
        --     sources = require("cmp").config.sources({
        --         -- You can specify the `git` source if [you were installed it]
        --         -- (https://github.com/petertriho/cmp-git).
        --         { name = 'git' }, 
        --     }, {
        --         { name = 'buffer' },
        --     })
        -- })

        -- Use buffer source for `/` and `?`
        -- (if you enabled `native_menu`, this won't work anymore).
        -- require("cmp").setup.cmdline({ '/', '?' }, {
        --     mapping = require("cmp").mapping.preset.cmdline(),
        --     sources = {
        --         { name = 'buffer' }
        --     }
        -- })

        -- Use cmdline & path source for ':'
        -- (if you enabled `native_menu`, this won't work anymore).

        -- require("cmp").setup.cmdline(':', {
        --     mapping = require("cmp").mapping.preset.cmdline(),
        --     sources = require("cmp").config.sources({
        --         { name = 'path' }
        --     }, {
        --         { name = 'cmdline' }
        --     })
        -- })
    end
}

return nvim_cmp
