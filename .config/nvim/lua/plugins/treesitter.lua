return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Tree Sitter parsers
    local parsers = {
      "lua",
      "rust",
      "java",
      "kotlin",
      "javascript",
      "typescript",
      "toml",
      "yaml",
      "json",
      "xml",
      "html",
      "css",
      "proto",
      "bash",
      "markdown"
    }

    -- Setup Tree Sitter
    local plugin = require("nvim-treesitter.configs")
    plugin.setup({
      sync_install = false,
      auto_install = true,
      ensure_installed = parsers,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
