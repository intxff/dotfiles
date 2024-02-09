local function setup()
	require("bqf").setup({
		auto_enable = true,
		magic_window = true,
		auto_resize_height = true,
		func_map = {
			pscrolldown = "<C-d>",
			pscrollup = "<C-u>",
		},
		preview = {
			auto_preview = true,
		},
		border = "rounded",
	})
end

local M = {
	"kevinhwang91/nvim-bqf",
	event = "VeryLazy",
	ft = "qf",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = setup,
}

return M
