require("window-picker").setup({
	filter_rules = {
		include_current_win = false,
		autoselect_one = true,
		-- filter using buffer options
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify" },
			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
})

require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "solid",
	source_selector = {
		winbar = false,
		statusline = true,
	},
	window = {
		position = "left",
		width = 30,
	},
})

vim.keymap.set("n", "<space>n", "<CMD>Neotree toggle last<CR>", { silent = true })
