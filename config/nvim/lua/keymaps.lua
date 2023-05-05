local gmap = vim.api.nvim_set_keymap
vim.g.mapleader = ";"

-- Save and quit
gmap('n', '<Leader>w', ':w<CR>', {noremap = true})
gmap('n', '<Leader>W', ':wq<CR>', {noremap = true})
gmap('n', '<Leader>q', ':q<CR>', {noremap = true})

-- Adjust windows size
gmap('n', '<C-e>h', [[<C-w><]], {noremap = true})
gmap('n', '<C-e>l', [[<C-w>>]], {noremap = true})
gmap('n', '<C-e>j', [[<C-w>-]], {noremap = true})
gmap('n', '<C-e>k', [[<C-w>+]], {noremap = true})

-- Copy and paste between vim and system
gmap('n', '<Leader>y', [["+yy]], {noremap = true})
gmap('v', '<Leader>y', [["+y]], {noremap = true})
gmap('n', '<Leader>p', [["+p]], {noremap = true})

-- Move block in visual mode
gmap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true})
gmap("v", "K", ":m '>-2<CR>gv=gv", {noremap = true})

-- clear highlights
gmap("n", "<leader>c", ":nohl", {noremap = true})
