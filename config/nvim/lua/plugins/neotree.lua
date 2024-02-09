local function setup()
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
		popup_border_style = "rounded",
		source_selector = {
			winbar = false,
			statusline = true,
		},
		window = {
			position = "left",
			width = 30,
		},
		popup = {
			position = { col = "50%", row = "10" },
			size = function(state)
				local root_name = vim.fn.fnamemodify(state.path, ":~")
				local root_len = string.len(root_name) + 4
				return {
					width = math.max(root_len, 90),
					height = vim.o.lines - 20,
				}
			end,
		},
		filesystem = {
			use_libuv_file_watcher = true,
			follow_current_file = {
				enabled = false,
			},
		},
	})

	vim.keymap.set("n", "<space>n", "<CMD>Neotree toggle last<CR>", { silent = true })
end

local M = {
	"nvim-neo-tree/neo-tree.nvim",
	-- "intxff/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
	keys = "<space>n",
	config = setup,
}

return M
