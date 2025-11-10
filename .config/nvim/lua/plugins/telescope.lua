return {
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
}
 
