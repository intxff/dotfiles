vim.cmd([[highlight IndentBlanklineContextChar guifg=#98C379 gui=nocombine]])

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
