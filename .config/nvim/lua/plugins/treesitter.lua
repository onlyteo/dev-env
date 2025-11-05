return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Tree Sitter parsers
    local treesitter_parsers = {
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
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      sync_install = false,
      auto_install = true,
      ensure_installed = treesitter_parsers,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
