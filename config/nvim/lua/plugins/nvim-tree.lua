-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { silent = true })
