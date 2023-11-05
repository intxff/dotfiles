vim.o.winwidth = 5
vim.o.winminwidth = 5
vim.o.equalalways = false
require("windows").setup({
	autowidth = {
		enable = true,
		winwidth = 0.8,
		-- filetype = {
		-- 	help = 2,
		-- },
	},
	animation = {
		enable = true,
		duration = 100,
		fps = 60,
		easing = "in_out_sine",
	},
})

-- keymaps
local keymaps = {
	maximize = {
		"n",
		"<C-w>z",
		"<Cmd>WindowsMaximize<CR>",
	},
	vertical = {
		"n",
		"<C-w>_",
		"<Cmd>WindowsMaximizeVertically<CR>",
	},
	horizontal = {
		"n",
		"<C-w>|",
		"<Cmd>WindowsMaximizeHorizontally<CR>",
	},
	equal = {
		"n",
		"<C-w>=",
		"<Cmd>WindowsEqualize<CR>",
	},
}

local keymap = vim.keymap.set
for _, value in pairs(keymaps) do
	keymap(unpack(value))
end
