local function setup()
	vim.g.mkdp_auto_start = 0
	vim.g.mkdp_browser = "firefox"
	vim.g.mkdp_preview_options = {
		mkit = {},
		katex = {},
		uml = {},
		maid = {},
		disable_sync_scroll = 0,
		sync_scroll_type = "middle",
		hide_yaml_meta = 1,
		sequence_diagrams = {},
	}
end
local M = {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	build = "cd app && yarn install",
	config = setup,
}

return M
