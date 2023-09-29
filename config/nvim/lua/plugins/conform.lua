require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		json = { "prettier" },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
	formatters = {},
})

local function format()
	require("conform").format({ async = true, lsp_fallback = true })
end

vim.keymap.set("n", "<space>f", format, { silent = true, noremap = true })
