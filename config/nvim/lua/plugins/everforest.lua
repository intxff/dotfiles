local function setup()
	vim.cmd([[colorscheme everforest]])

	-- local function get_linked_groups(group)
	-- 	local hl_attrs = vim.api.nvim_get_hl(0, { name = group, link = true })
	-- 	local linked_group = hl_attrs["link_to"]
	-- 	if linked_group then
	-- 		return { linked_group, unpack(get_linked_groups(linked_group)) }
	-- 	else
	-- 		return {}
	-- 	end
	-- end
	--
	-- -- @param group: group A is linked to groups. Here group is group A
	-- -- @param highlight
	-- local function recover_linked_groups(group, highlight)
	-- 	local linked_groups = get_linked_groups(group)
	-- 	for _, linked_group in ipairs(linked_groups) do
	-- 		vim.api.nvim_set_hl(0, linked_group, highlight)
	-- 	end
	-- end

	-- record raw color in theme
	local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
	local raw_normal_float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
	local raw_float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })
	-- local raw_pmenu = vim.api.nvim_get_hl(0, { name = "Pmenu" })
	-- set hover and cmp menu the same color with bg
	vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
	vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
	local new_float_border = raw_float_border
	new_float_border.bg = normal.bg
	new_float_border.ctermbg = normal.ctermbg
	vim.api.nvim_set_hl(0, "FloatBorder", new_float_border)

	-- -- recover colors of others linked to theme
	-- recover_linked_groups("NormalFloat", raw_normal_float)
	-- recover_linked_groups("FloatBorder", raw_float_border)
	-- recover_linked_groups("Pmenu", raw_pmenu)

	--  plugins lazy loaded
	vim.api.nvim_set_hl(0, "MasonNormal", raw_normal_float)
	vim.api.nvim_set_hl(0, "LazyNormal", raw_normal_float)
	-- vim.api.nvim_set_hl(0, "NeoTreeNormal", raw_normal_float)
	vim.api.nvim_set_hl(0, "DropBarMenuNormalFloat", raw_normal_float)
end
local M = {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	event = "VeryLazy",
	config = setup,
}

return M
