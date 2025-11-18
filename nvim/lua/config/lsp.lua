vim.lsp.enable("lua_ls")

vim.lsp.config("*", {
    root_markers = { ".git" }
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
vim.keymap.set("n", "<leader>wl",
    function()
        local workspaces = vim.lsp.buf.list_workspace_folders()
            for i, workspace in ipairs(workspaces) do
                print(i, workspace)
            end
        end,
    {})
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, {})
vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
