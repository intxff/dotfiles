local common = require('plugins.lsp.common')
require 'lspconfig'.rust_analyzer.setup {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  single_file_support = true,
  root_dir = require('lspconfig.util').root_pattern(
    "Cargo.toml",
    "rust-project.json"
  ),
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  },
  handlers = common.handlers,
  flags = {
    debounce_text_changes = common.debounce_text_changes,
  },
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}
