-- https://github.com/sindrets/diffview.nvim
local function setup()
	require("diffview").setup()
end

local M = {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	config = setup,
}

return M
