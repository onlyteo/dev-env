return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local plugin = require("lualine")
        plugin.setup({
            options = {
                theme = "dracula"
            }
        })
    end
}