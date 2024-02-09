local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ";" -- Make sure to set `mapleader` before lazy so your mappings are correct

local code = {
	"c",
	"cpp",
	"rust",
	"go",
	"typescript",
	"javascript",
	"python",
	"bash",
	"lua",
}

require("lazy").setup({
	-- colorscheme
	require("plugins.everforest"),
	{ "h-hg/fcitx.nvim", event = "VeryLazy" },
	require("plugins.neotree"),
	require("plugins.markdown-preview"),
	require("plugins.lualine"),
	require("plugins.indent"),
	require("plugins.treesitter"),
	require("plugins.dropbar"),
	require("plugins.navbuddy"),
	require("plugins.todo"),
	require("plugins.comments").config(code),
	require("plugins.colorizer"),
	require("plugins.ufo"),
	require("plugins.hlslens"),
	require("plugins.statuscol"),
	require("plugins.lspkind"),
	require("plugins.lsp"),
	require("plugins.mason"),
	require("plugins.conform"),
	require("plugins.luasnip"),
	require("plugins.cmp"),
	require("plugins.gitsigns"),
	require("plugins.diffview"),
	require("plugins.fzf"),
	require("plugins.bqf"),
	require("plugins.dap"),
	require("plugins.windows"),
	require("plugins.flutter"),
	require("plugins.toggleterm"),
}, {
	defaults = {
		lazy = true,
	},
})
