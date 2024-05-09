return {
    'romgrk/barbar.nvim',
    lazy = true,
    events = { 'VeryLazy' },
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Move to previous/next
        map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
        -- Pin/unpin buffer
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
        -- Close buffer
        map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
        -- Close all other tabs
        map('n', '<A-w>', '<cmd>BufferCloseAllButCurrent<CR>', opts)
    end,
    opts = {
        exclude_name = { 'Alpha' },
        sidebar_filetypes = {
            NvimTree = true,
        },
        gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
        },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
