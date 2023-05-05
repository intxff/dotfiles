local common = require('plugins.lsp.common')
require 'lspconfig'.clangd.setup {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  single_file_support = true,
  root_dir = require('lspconfig.util').root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  handlers = common.handlers,
  flags = {
    debounce_text_changes = common.debounce_text_changes,
  },
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}
