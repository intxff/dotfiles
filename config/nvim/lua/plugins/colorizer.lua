local M = {
	"norcalli/nvim-colorizer.lua",
	cmd = "ColorizerToggle",
	config = function()
		require("colorizer").setup()
	end,
}

return M
