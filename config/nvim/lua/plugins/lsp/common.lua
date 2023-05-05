-- UI
-- diagnostic
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- common options for every lsp server
local CommonOpts = {}
CommonOpts.on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  mappings = {
    {"n", "gd", vim.lsp.buf.definition},
    {"n", "gD", vim.lsp.buf.declaration},
    {"n", "[d", vim.diagnostic.goto_prev},
    {"n", "]d", vim.diagnostic.goto_next},
    {"n", "K", vim.lsp.buf.hover},
    {"n", "<space>f", function() vim.lsp.buf.format { async = true } end},
    {"n", "<space>r", vim.lsp.buf.rename},
    {"n", "<space>c", vim.lsp.buf.code_action},
    {"n", "<space>wa", vim.lsp.buf.add_workspace_folder},
    {"n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts},
    {"n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end},
  }
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  for _, entry in pairs(mappings) do
    vim.keymap.set(entry[1], entry[2], entry[3], bufopts)
  end
end

CommonOpts.debounce_text_changes = 100
CommonOpts.capabilities = require('cmp_nvim_lsp').
  default_capabilities(vim.lsp.protocol.make_client_capabilities())
CommonOpts.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

return CommonOpts
