require('Comment').setup({
  --[[ toggler = {
    ---Line-comment toggle keymap
    line = '<leader>l',
    ---Block-comment toggle keymap
    block = '<leader>b',
  }, ]]
  -- LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = 'gc',
    ---Block-comment keymap
    block = 'gb',
  },
})
