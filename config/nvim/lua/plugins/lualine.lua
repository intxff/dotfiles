-- Lualine config
require("lualine").setup({
	options = {
		disabled_filetypes = {
			statusline = { "neo-tree" },
			winbar = {},
		},
		theme = "everforest",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
			},
		},
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"tabs",
				max_length = vim.o.columns / 3, -- Maximum width of tabs component.
				-- Note:
				-- It can also be a function that returns
				-- the value of `max_length` dynamically.
				mode = 2,

				-- -- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
				-- use_mode_colors = false,
				--
				-- tabs_color = {
				-- 	-- Same values as the general color option can be used here.
				-- 	active = "lualine_{section}_normal", -- Color for active tab.
				-- 	inactive = "lualine_{section}_inactive", -- Color for inactive tab.
				-- },

				-- fmt = function(name, context)
				-- 	-- Show + if buffer is modified in tab
				-- 	local buflist = vim.fn.tabpagebuflist(context.tabnr)
				-- 	local winnr = vim.fn.tabpagewinnr(context.tabnr)
				-- 	local bufnr = buflist[winnr]
				-- 	local mod = vim.fn.getbufvar(bufnr, "&mod")
				--
				-- 	return name .. (mod == 1 and " +" or "")
				-- end,
			},
		},
	},
})
