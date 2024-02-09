local function setup()
	-- change hightlight of menu
	vim.cmd([[highlight Winbar gui=none]])
	vim.cmd([[highlight! link DropBarCurrentContext NormalFloat]])
	vim.cmd([[highlight DropBarMenuHoverEntry guifg=#a7c080 guibg=#4F585E]])
	vim.cmd([[highlight DropBarMenuCurrentContext guifg=#a7c080 guibg=#4F585E]])

	local dropbar = require("dropbar")
	local api = require("dropbar.api")
	local utils = require("dropbar.utils")

	dropbar.setup({
		general = {
			enable = function(buf, win)
				return not vim.api.nvim_win_get_config(win).zindex
					and vim.bo[buf].buftype == ""
					and vim.api.nvim_buf_get_name(buf) ~= ""
					and not vim.wo[win].diff
					and vim.bo[buf].buftype ~= "qf"
			end,
		},
		menu = {},
	})

	local picker_toggle = function()
		local bar = utils.bar.get_current()
		if not bar then
			local menu = utils.menu.get_current()
			if menu then
				menu:close()
				return
			end
		end

		if not bar.menu then
			api.pick()
		end
	end

	vim.keymap.set("n", "<leader>d", picker_toggle, { silent = true })
end

local M = {
	"Bekaboo/dropbar.nvim",
	enabled = false,
	event = "VeryLazy",
	config = setup,
}

return M
