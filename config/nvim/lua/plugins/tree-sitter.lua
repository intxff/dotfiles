require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'c',
        'cpp',
        'python',
        'rust',
        'java',
        'go',
        'lua',
        'javascript',
        'typescript',
        'css',
        'html',
        'markdown',
        'markdown_inline',
        'dart',
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
    --  ignore_install = { "javascript" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        --    disable = { "c", "rust" },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
