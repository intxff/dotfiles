vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", { noremap = true, silent = true })

local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    preview = {
      layout = "flex",
    }
  },
})
