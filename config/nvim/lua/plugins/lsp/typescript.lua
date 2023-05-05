local common = require("plugins.lsp.common")
require 'lspconfig'.tsserver.setup {
  on_attach = common.on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
