return {
    'nvim-tree/nvim-tree.lua',
    main = 'nvim-tree',
    opts = {
        sort_by = 'case_sensitive',
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
            custom = { '^.git$' },
        },

        --- Project manager
        sync_root_with_cwd = false,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = false,
            update_root = false,
        },
        on_attach = function(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return {
                    desc = 'nvim-tree: ' .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true,
                }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set(
                'n',
                '<C-s>',
                api.node.open.vertical,
                opts('Open In Vertical Split')
            )
            vim.keymap.set(
                'n',
                '<C-h>',
                api.node.open.horizontal,
                opts('Open In horizontal Split')
            )
        end,
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
