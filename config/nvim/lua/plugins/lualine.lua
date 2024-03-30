local short_path = function()
	local win_width = vim.api.nvim_win_get_width(0)
	local buf_path = vim.fn.expand("%:.")
	local path_parts = {}
	for part in string.gmatch(buf_path, "([^/]+)") do
		table.insert(path_parts, part)
	end
	if #path_parts < 4 or string.len(buf_path) * 4 < win_width then
		return " " .. buf_path .. " 󰁕"
	end

	local mid_path = table.concat(path_parts, "/", 2, #path_parts - 1)
	buf_path = path_parts[1] .. "/" .. vim.fn.pathshorten(mid_path, 1) .. "/" .. path_parts[#path_parts]
	return " " .. buf_path .. " 󰁕"
end

local function setup()
	require("lualine").setup({
		options = {
			globalstatus = true,
			disabled_filetypes = {
				--statusline = { "neo-tree" },
				winbar = { "neo-tree", "qf", "toggleterm", "help" },
			},
			theme = "everforest",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
		extensions = { "quickfix" },
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				"branch",
			},
			lualine_c = {
				"diff",
				{
					"diagnostics",
					sources = { "nvim_diagnostic", "nvim_lsp" },
				},
				--"filename",
			},
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
		--[[
		tabline = {
			lualine_a = {
				{
					"tabs",
					max_length = vim.o.columns / 3, -- Maximum width of tabs component.
					mode = 2,
				},
			},
		},
		winbar = {
			lualine_c = {
				{
					short_path,
					color = "Normal",
					draw_empty = true,
				},
				{
					"navic",
					separator = ">",
					padding = 0,
				},
			},
		},
		inactive_winbar = {
			lualine_c = {
				{
					short_path,
					color = "Normal",
					draw_empty = true,
				},
				{
					"navic",
					separator = ">",
					padding = 0,
				},
			},
		},
    --]]
	})
	-- change preset lualine_a_tabs_active pink color to green
	vim.cmd([[highlight! link lualine_a_tabs_active lualine_a_normal]])
end

local M = {
	"nvim-lualine/lualine.nvim",
	event = "BufReadPre",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = setup,
}

return M
