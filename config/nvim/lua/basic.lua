-- mouse control
vim.opt.mouse = 'a'

-- search case insensitively
vim.opt.ignorecase = true
vim.smartcase = true

-- Guicolor
vim.opt.termguicolors = true

-- fold configured by plugin nvim-ufo
--[[ vim.opt.foldmethod = "syntax"
vim.opt.foldexpr = "vim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99 ]]

vim.opt.list = true
-- Prevent unprintable symbols
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- signcolumn always on
vim.opt.signcolumn = "yes"

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8, ucs-bom, cp936, gb18030, big5, latin1'

-- Swap file place
-- vim.opt.dir:prepend { "~/.vimswap/" }

-- Row and column
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.colorcolumn = '80'
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Tab and space
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
local changetabforfiles = function()
  local filelist = { 'lua', 'javascript', 'css', 'html' }
  for _, value in ipairs(filelist) do
    if (vim.bo.filetype == value)
    then
      vim.bo.tabstop = 2
      vim.bo.shiftwidth = 2
      vim.bo.softtabstop = 2
    end
  end
end
vim.api.nvim_create_autocmd(
  { 'FileType' },
  { callback = changetabforfiles }
)


-- Nowrap for code files
vim.opt.wrap = false
local changewrap = function()
  if (vim.bo.filetype == 'markdown')
  then
    vim.wo.wrap = true
  else
    vim.wo.wrap = false
  end
end
vim.api.nvim_create_autocmd(
  { 'FileType' },
  { callback = changewrap }
)

-- Autoreload
vim.opt.autoread = true
vim.opt.autowrite = true
