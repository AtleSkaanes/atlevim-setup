return {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
        { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
        { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    lazy = true,
    event = 'VeryLazy',
    opts = {
        -- prompts = {
        --     Explain = {
        --         prompt = 'Explain how the given code works, and what its usecases could be for.',
        --         mapping = '<leader>cce',
        --         description = 'Explains the selected code',
        --         selection = require('CopilotChat').selection.visual,
        --     },
        -- },
    },
    init = function()
        require('copilot').setup()

        vim.keymap.set('v', '<leader><leader>cq', function()
            vim.ui.input({ prompt = 'Quick Chat: ' }, function(input)
                if input ~= '' then
                    require('CopilotChat').ask(
                        input,
                        { selection = require('CopilotChat.select').visual }
                    )
                end
            end)
        end, { desc = 'CopilotChat - Quick chat' })

        vim.keymap.set(
            'v',
            '<leader><leader>ce',
            function()
                require('CopilotChat').ask(
                    'Explain the given code',
                    { selection = require('CopilotChat.select').visual }
                )
            end,
            { desc = 'CopilotChat - Quick chat' }
        )

        vim.keymap.set(
            'v',
            '<leader><leader>cd',
            function()
                require('CopilotChat').ask(
                    'Explain the given codes error',
                    { selection = require('CopilotChat.select').diagnostics }
                )
            end,
            { desc = 'CopilotChat - Quick chat' }
        )
    end,
}
