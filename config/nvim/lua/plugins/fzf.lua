local function setup()
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
	keymap("n", "<leader>b", fzf.buffers, opts)
	keymap("n", "<leader>a", "<cmd>FzfLua<cr>", opts)
end

local M = {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = setup,
}

return M
