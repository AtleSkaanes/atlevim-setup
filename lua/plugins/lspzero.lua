return {
    'VonHeikemen/lsp-zero.nvim',
    main = 'lsp-zero',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    branch = 'v3.x',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Language Support
        'simrat39/rust-tools.nvim',
        -- LSP Support
        'neovim/nvim-lspconfig',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        -- LuaSnip
        'L3MON4D3/cmp_luasnip',

        -- neodev
        'folke/neodev.nvim',
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set(
                'n',
                'gd',
                function() vim.lsp.buf.definition() end,
                opts
            )
            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set(
                'n',
                '<leader>vws',
                function() vim.lsp.buf.workspace_symbol() end,
                opts
            )
            vim.keymap.set(
                'n',
                '<leader>vd',
                function() vim.diagnostic.open_float() end,
                opts
            )
            vim.keymap.set(
                'n',
                '[d',
                function() vim.diagnostic.goto_next() end,
                opts
            )
            vim.keymap.set(
                'n',
                ']d',
                function() vim.diagnostic.goto_prev() end,
                opts
            )
            vim.keymap.set(
                'n',
                '<leader>vca',
                function() vim.lsp.buf.code_action() end,
                opts
            )
            vim.keymap.set(
                'n',
                '<leader>vrr',
                function() vim.lsp.buf.references() end,
                opts
            )
            vim.keymap.set(
                'n',
                '<leader>vrn',
                function() vim.lsp.buf.rename() end,
                opts
            )
            vim.keymap.set(
                'i',
                '<C-h>',
                function() vim.lsp.buf.signature_help() end,
                opts
            )
        end)
        lsp_zero.set_preferences({
            sign_icons = {},
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason').setup({
            ensure_installed = { 'clang-format', 'marksman', 'markdownlint' },
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'clangd',
                'rust_analyzer',
                'lua_ls',
                'slint_lsp',
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lspconfig.lua_ls.setup(lua_opts)
                end,

                rust_analyzer = function()
                    local rust_tools = require('rust-tools')

                    rust_tools.setup({
                        server = {
                            on_attach = function(client, bufnr)
                                require('navic').attach(client, bufnr)
                                vim.keymap.set(
                                    'n',
                                    '<C-space>',
                                    rust_tools.hover_actions.hover_actions,
                                    { buffer = bufnr }
                                )
                                -- Code action groups
                                vim.keymap.set(
                                    'n',
                                    '<Leader>a',
                                    rust_tools.code_action_group.code_action_group,
                                    { buffer = bufnr }
                                )
                            end,
                        },
                    })
                end,
                clangd = function()
                    lspconfig.clangd.setup({
                        on_attach = function(client, bufnr)
                            client.server_capabilities.signatureHelpProvoder =
                                false
                            require('navic').attach(client, bufnr)
                            require('nvim-navbuddy').attach(client, bufnr)
                        end,
                        capabilities = capabilities,
                    })
                end,
                slint_lsp = function()
                    local opts = {
                        command = 'slint-lsp',
                        filetypes = 'slint',
                    }
                    lspconfig.slint_lsp.setup(opts)
                end,
            },
        })

        local rt = require('rust-tools')

        rt.setup({
            dap = {
                adapter = require('dap').adapters.codelldb,
            },
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set(
                        'n',
                        '<leader>k',
                        rt.hover_actions.hover_actions,
                        { buffer = bufnr }
                    )
                    vim.keymap.set(
                        'n',
                        '<Leader>a',
                        rt.code_action_group.code_action_group,
                        { buffer = bufnr }
                    )
                end,
            },
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },
        })
    end,
}
