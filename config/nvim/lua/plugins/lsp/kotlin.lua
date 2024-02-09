require("lspconfig").kotlin_language_server.setup({
	cmd = { "kotlin-language-server" },
	filetypes = { "kotlin" },
	on_attach = require("plugins.lsp.common").on_attach,
	capabilities = require("plugins.lsp.common").capabilities,
	handlers = require("plugins.lsp.common").handlers,
})
