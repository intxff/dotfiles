require("lspconfig").gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "gomod", "go" },
	root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			semanticTokens = true,
			usePlaceholders = true,
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
				fieldalignment = true,
				nilness = true,
				unusedwrite = true,
			},
			staticcheck = true,
		},
	},
})
