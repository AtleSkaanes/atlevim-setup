return {
    'nvim-telescope/telescope.nvim',
    main = 'telescope',
    lasy = false,
    opts = {},
    dependencies = {
        'nvim-lua/plenary.nvim',
        'AtleSkaanes/telescope-plugins',
    },
    config = function()
        require('telescope').setup({
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown({
                        -- even more opts
                    }),
                },
            },
        })
    end,
    init = function()
        --- Telescope
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>cs', builtin.colorscheme, {})
        vim.keymap.set('n', '<leader>cc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

        -- LSP
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
        vim.keymap.set('n', '<leader>vf', builtin.lsp_workspace_symbols, {})

        -- GIT
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

        require('telescope').load_extension('telescopeplugins')
    end,
}
