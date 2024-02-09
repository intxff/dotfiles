-- mouse control
vim.opt.mouse = "a"

-- search case insensitively
vim.opt.ignorecase = false
vim.smartcase = true

-- Guicolor and colorscheme
vim.opt.termguicolors = true

vim.opt.list = true
-- Prevent unprintable symbols
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- signcolumn always on
vim.opt.signcolumn = "yes"

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8, ucs-bom, cp936, gb18030, big5, latin1"

-- Row and column
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.colorcolumn = "80"
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Tab and space
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
local changetabforfiles = function()
	local filelist = { "lua", "javascript", "css", "html", "json" }
	for _, value in ipairs(filelist) do
		if vim.bo.filetype == value then
			vim.bo.tabstop = 2
			vim.bo.shiftwidth = 2
			vim.bo.softtabstop = 2
		end
	end
end
vim.api.nvim_create_autocmd({ "FileType" }, { callback = changetabforfiles })

-- Nowrap for code files
vim.opt.wrap = false
local changewrap = function()
	if vim.bo.filetype == "markdown" then
		vim.wo.wrap = true
	else
		vim.wo.wrap = false
	end
end
vim.api.nvim_create_autocmd({ "FileType" }, { callback = changewrap })

-- use capslock to replace esc in insert mode
-- local function caps_to_esc()
-- 	os.execute("setxkbmap -option caps:escape")
-- end
-- local function caps_to_normal()
-- 	os.execute("setxkbmap -option")
-- end
-- vim.api.nvim_create_autocmd({ "InsertEnter" }, { callback = caps_to_esc })
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, { callback = caps_to_normal })

-- keymaps
vim.g.mapleader = ";"
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>W", ":wq<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Switch windows
keymap("n", "<C-h>", [[<C-w>h]], opts)
keymap("n", "<C-l>", [[<C-w>l]], opts)
keymap("n", "<C-j>", [[<C-w>j]], opts)
keymap("n", "<C-k>", [[<C-w>k]], opts)

-- Adjust windows size
keymap("n", "<C-e>h", [[<C-w><]], opts)
keymap("n", "<C-e>l", [[<C-w>>]], opts)
keymap("n", "<C-e>j", [[<C-w>-]], opts)
keymap("n", "<C-e>k", [[<C-w>+]], opts)

-- Copy and paste between vim and system
keymap("n", "<leader>y", [["+yy]], opts)
keymap("v", "<leader>y", [["+y]], opts)
keymap("n", "<leader>p", [["+p]], opts)

-- Move block in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '>-2<CR>gv=gv", opts)

-- Jump in quickfix
keymap("n", "<C-n>", ":cn<CR>", opts)
keymap("n", "<C-p>", ":cp<CR>", opts)
