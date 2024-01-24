return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
        require("toggleterm").setup{
            open_mapping = [[<leader>t]],
            autochdir = true,
            start_in_insert = true,
            shell = 'bash'
        }
    end
}
