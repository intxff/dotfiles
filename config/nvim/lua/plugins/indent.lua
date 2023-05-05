vim.cmd [[highlight IndentBlanklineContextChar guifg=#61AFEF gui=nocombine]]

vim.opt.list = true
-- Prevent unprintable symbols
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  filetype = {'go', 'cpp', 'c', 'rust', 'java', 'javascript'},
--  buftype_exclude = {'terminal', 'help', 'dashboard'},
--  filetype_exclude = {'terminal', 'help', 'dashboard'},
  context_char = '┃',
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
