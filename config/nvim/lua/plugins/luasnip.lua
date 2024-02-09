local function setup()
	require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
end

local M = {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	build = "make install_jsregexp",
	event = "VeryLazy",
	config = setup,
}

return M
