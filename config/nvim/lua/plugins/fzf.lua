local fzf = require("fzf-lua")
fzf.setup({
	winopts = {
		preview = {
			vertical = "up:60%",
			layout = "vertical",
		},
	},
	keymap = {
		builtin = {
			["<C-d>"] = "preview-page-down",
			["<C-u>"] = "preview-page-up",
			["<C-r>"] = "preview-page-reset",
		},
	},
})

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "<leader>f", fzf.files, opts)
keymap("n", "<leader>a", "<cmd>FzfLua<cr>", opts)
keymap("n", "gr", fzf.lsp_references, opts)
keymap("n", "gi", fzf.lsp_implementations, opts)
keymap("n", "<space>i", fzf.lsp_incoming_calls, opts)
keymap("n", "go", fzf.lsp_outgoing_calls, opts)
