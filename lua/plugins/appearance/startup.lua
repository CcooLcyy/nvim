return {
    "goolord/alpha-nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function ()
        -- startify
        require("alpha").setup(require("alpha.themes.startify").config)
    end
}
