-- https://github.com/lewis6991/gitsigns.nvim
local function setup()
	require("gitsigns").setup({
		current_line_blame = false,
	})
end

local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = setup,
}

return M
