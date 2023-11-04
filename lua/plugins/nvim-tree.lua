return {
    'nvim-tree/nvim-tree.lua',
    main = 'nvim-tree',
    opts = {
        sort_by = "case_sensitive",
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false, custom = { '^.git$' }
        },

        --- Project manager
        sync_root_with_cwd = false,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = false,
            update_root = false
        },
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}

