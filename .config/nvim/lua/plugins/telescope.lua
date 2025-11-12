return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()    
            local plugin = require("telescope.builtin")
            
            vim.keymap.set("n", "<leader>ff", plugin.find_files, {})
            vim.keymap.set("n", "<leader>fg", plugin.live_grep, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local plugin = require("telescope")
            local themesPlugin = require("telescope.themes")
            plugin.setup({
                extensions = {
                    ["ui-select"] = {
                        themesPlugin.get_dropdown {
                        }
                    }
                }
            })
            plugin.load_extension("ui-select")
        end
    }
}
