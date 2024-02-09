require("lspconfig").clangd.setup({
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_dir = require("lspconfig.util").root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
	single_file_support = true,
	settings = {},
	on_attach = require("plugins.lsp.common").on_attach,
	capabilities = require("plugins.lsp.common").capabilities,
	handlers = require("plugins.lsp.common").handlers,
})
