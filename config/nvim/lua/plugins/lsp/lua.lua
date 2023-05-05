-- Lua
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/usr/lib/lua-language-server'
local sumneko_log_path = vim.fn.stdpath('cache') .. "/lua/log"
local sumneko_meta_path = vim.fn.stdpath('cache') .. "/lua/meta"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

-- runtime path
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
table.insert(runtime_path, "/usr/share/nvim/runtime/lua")
table.insert(runtime_path, "/usr/share/lua/5.3/?/init.lua")
table.insert(runtime_path, "/usr/share/awesome/lib/?.lua")
table.insert(runtime_path, "/usr/share/awesome/lib/?/init.lua")

-- setup
local common = require('plugins.lsp.common')
return require 'lspconfig'.lua_ls.setup {
  cmd = { sumneko_binary, "--logpath="..sumneko_log_path, "--metapath="..sumneko_meta_path },
  root_dir = require('lspconfig.util').root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml",
    "stylua.toml", "selene.toml", "selene.yml", ".git", "rc.lua", "init.lua"),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'lua 5.3',
        -- Setup your lua path
        path = {
          '?/init.lua',
          '?.lua',
          '?/init.lua',
          vim.fn.expand '~/.luarocks/share/lua/5.3/?.lua',
          vim.fn.expand '~/.luarocks/share/lua/5.3/?/init.lua',
          '/usr/share/5.3/?.lua',
          '/usr/share/lua/5.3/?/init.lua',
          'rc.lua',
        }
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'screen', "client", },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          vim.api.nvim_get_runtime_file("", true),
          runtime_path,
          "/usr/share/awesome/lib",
        },
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  handlers = common.handlers,
  on_attach = common.on_attach,
  flags = {
    debounce_text_changes = common.debounce_text_changes,
  },
  capabilities = common.capabilities,
}
