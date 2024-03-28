local function setup()
	require("plugins.dap.common")
	require("plugins.dap.go")
	require("plugins.dap.lua")
end

local M = {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
		"nvim-neotest/nvim-nio",
	},
	config = setup,
}

return M
