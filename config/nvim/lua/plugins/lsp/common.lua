-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
	float = { border = "rounded" },
})

local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

local on_attach = function(client, bufnr)
	-- keymaps
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.incoming_calls, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.outgoing_calls, opts)
	vim.keymap.set("n", "<space>i", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<space>d", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<space>I", function()
		vim.lsp.inlay_hint(0, nil)
	end, opts)
	vim.keymap.set({ "n", "v" }, "<space>c", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)

	-- navic symbol
	local navbuddy = require("nvim-navbuddy")
	local navic = require("nvim-navic")
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
		navbuddy.attach(client, bufnr)
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

return { on_attach = on_attach, capabilities = capabilities, handlers = handlers }
