return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  config = function()
    local plugin = require("neo-tree")
    plugin.setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          show_hidden_count = true
        }
      }
    })
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")
  end
}
