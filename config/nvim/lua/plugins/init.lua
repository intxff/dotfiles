local code_filetypes = {
  "c", "cpp", "go", "rust", "python",
  "typescript", "javascript", "css", "html",
  "lua", "markdown",
}

vim.g.mapleader = ";"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorscheme
  {
    "sainnhe/everforest",
    priority = 1000,
    lazy = false,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme everforest]])
    end,
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    lazy = true,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme sonokai]])
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  -- fold
  {
    "kevinhwang91/nvim-ufo",
    lazy = true,
    config = function()
      require("plugins.nvim-ufo")
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  -- fcitx auto switch
  { "h-hg/fcitx.nvim" },
  -- icons
  { "nvim-tree/nvim-web-devicons" },
  -- Statusline
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup()
    end,
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  },
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  },
  -- tree view of files
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvim-tree")
    end,
  },
  -- symbols
  {
    "simrat39/symbols-outline.nvim",
    ft = code_filetypes,
    config = function()
      require("plugins.symbols")
    end,
  },
  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && yarn install",
    config = function()
      require("plugins.markdown-preview")
    end
  },
  -- Comment
  {
    "numToStr/Comment.nvim",
    ft = code_filetypes,
    config = function()
      require("plugins.comment")
    end
  },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    ft = code_filetypes,
    dependencies = {
      "rafamadriz/friendly-snippets",
    }
  },
  -- Tree sitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ft = code_filetypes,
    config = function()
      require("plugins.tree-sitter")
    end
  },
  -- lsp and compeletion
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp",               dependencies = { "neovim/nvim-lspconfig" } },
      { "saadparwaiz1/cmp_luasnip",           dependencies = { "L3MON4D3/LuaSnip" } },
      { "rafamadriz/friendly-snippets" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
    },
    config = function()
      require("plugins.nvim-cmp")
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    enabled = false,
    ft = code_filetypes,
    config = function()
      require("plugins.lspsaga")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  -- dap
  {
    "mfussenegger/nvim-dap",
    ft = code_filetypes,
    config = function()
      require("plugins.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = code_filetypes,
    dependencies = {
      { "mfussenegger/nvim-dap" },
    },
    config = function()
      require("plugins.dap.dapui")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    dependencies = {
      { "mfussenegger/nvim-dap" },
    },
    config = function()
      require("plugins.dap.go")
    end,
  },
  -- fzf
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("plugins.fzf-lua")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    }
  },
  -- todo list
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
})
