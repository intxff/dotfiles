local common = require('plugins.lsp.common')
require 'lspconfig'.dartls.setup {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  single_file_support = true,
  root_dir = require('lspconfig.util').root_pattern(
    "Cargo.toml",
    "rust-project.json"
  ),
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true
    }
  },
  handlers = common.handlers,
  flags = {
    debounce_text_changes = common.debounce_text_changes,
  },
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}
