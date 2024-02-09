-- https://github.com/onsails/lspkind.nvim
local function setup()
	require("lspkind").init({
		mode = "symbol_text",
		preset = "codicons",
	})
end

local M = {
	"onsails/lspkind.nvim",
	config = setup,
}

return M
