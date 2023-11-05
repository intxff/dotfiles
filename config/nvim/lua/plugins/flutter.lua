require("flutter-tools").setup({
	lsp = {
		on_attach = require("plugins.lsp.common").on_attach,
		capabilities = require("plugins.lsp.common").capabilities,
		handlers = require("plugins.lsp.common").handlers,
	},
})
