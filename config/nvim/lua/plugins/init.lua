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
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme everforest]])
		end,
	},
	-- fcitx5 switch
	{ "h-hg/fcitx.nvim", event = "VeryLazy" },
	-- tree view of files, buffers, git
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
		},
		keys = "<space>n",
		config = function()
			require("plugins.neotree")
		end,
	},
	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = "cd app && yarn install",
		config = function()
			require("plugins.markdown-preview")
		end,
	},
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "BufReadPre",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.lualine")
		end,
	},
	-- indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		config = function()
			require("plugins.indent")
		end,
	},
	-- treesitter for highlight
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = function()
			vim.cmd([[TSUpdate]])
		end,
		config = function()
			require("plugins.treesitter")
		end,
	},
	-- breadcrumbs
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.dropbar")
		end,
	},
	-- todo list
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("todo-comments").setup()
		end,
	},
	-- comment
	{
		"numToStr/Comment.nvim",
		-- https://github.com/numToStr/Comment.nvim
		opts = {
			toggler = {
				line = "<leader>c",
				block = "<leader>b",
			},
			opleader = {
				line = "<leader>c",
				block = "<leader>b",
			},
		},
		ft = code,
	},
	-- show color of hex code
	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("plugins.colorizer")
		end,
	},
	-- fold
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.ufo")
		end,
	},
	-- hlslen
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("plugins.hlslens")
		end,
	},
	-- sidebar to combine gitsign, fold and so on
	{
		"luukvbaal/statuscol.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
			require("plugins.statuscol")
		end,
	},
	-- lsp, linter, formatter related
	-- nvim-lspconfig
	{
		"onsails/lspkind.nvim",
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("plugins.lspkind")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"onsails/lspkind.nvim",
			"williamboman/mason.nvim",
		},
		config = function()
			require("plugins.lsp")
		end,
	},
	-- installer
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
		event = "VeryLazy",
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("plugins.mason")
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		enabled = true,
		event = "VeryLazy",
		depenencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("plugins.conform")
		end,
	},
	-- completion
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = "make install_jsregexp",
		event = "VeryLazy",
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("plugins.luasnip")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("plugins.cmp")
		end,
	},
	-- git related
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.diffview")
		end,
	},
	-- fzf
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.fzf")
		end,
	},
}, {
	defaults = {
		lazy = true,
	},
})
