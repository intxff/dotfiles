local function setup()
	require("flutter-tools").setup({
		lsp = {
			on_attach = require("plugins.lsp.common").on_attach,
			capabilities = require("plugins.lsp.common").capabilities,
			handlers = require("plugins.lsp.common").handlers,
		},
	})
end

local M = {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = setup,
}

return M
