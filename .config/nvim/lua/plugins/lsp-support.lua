return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local plugin = require("mason")
            plugin.setup({
            })
        end
    },
    {
        "mason-org/mason.nvim",
        config = function()
            local plugin = require("mason")
            plugin.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            local plugin = require("mason-lspconfig")
            plugin.setup({
                ensure_installed = { 
                    "lua_ls"
                },
                automatic_enable = {
                    "lua_ls"
                }
            })
        end
    }
}