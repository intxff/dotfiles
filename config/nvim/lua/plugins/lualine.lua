-- Lualine config
require('lualine').setup {
  options = {
    theme = "everforest",
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff',
      {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'coc', },
        diagnostics_color = {
          warn = { fg = '#ffa500' },
          hint = { fg = '#ffff00' },
          error = { fg = '#e32636' },
          info = { fg = '#aaffff' },
        },
      }
    },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}
