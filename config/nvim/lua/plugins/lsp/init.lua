local function setup()
	require("plugins.lsp.common")
	require("plugins.lsp.go")
	require("plugins.lsp.lua")
	require("plugins.lsp.efm")
	require("plugins.lsp.rust")
	require("plugins.lsp.kotlin")
end

local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"onsails/lspkind.nvim",
		"williamboman/mason.nvim",
	},
	config = setup,
}

return M
