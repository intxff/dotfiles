require("lspconfig").gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
	single_file_support = true,
	settings = {
		gopls = {
			semanticTokens = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				shadow = true,
				fieldalignment = true,
				nilness = true,
				unusedwrite = true,
			},
			staticcheck = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				parameterNames = true,
				functionTypeParameters = true,
				rangeVariableTypes = true,
			},
			hoverKind = "FullDocumentation",
		},
	},
	capabilities = require("plugins.lsp.common").capabilities,
	handlers = require("plugins.lsp.common").handlers,
})
