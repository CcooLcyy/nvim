return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
        require("toggleterm").setup{
            direction = "float",
            -- open_mapping = [[<leader>t]],
            autochdir = true,
            start_in_insert = true,
            shell = 'bash',
            float_opts = {
                border = "curved",
            }
        }
    end
}
