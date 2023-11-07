return {
    'rcarriga/nvim-dap-ui',
    main = 'nvim-dap-ui',
    lazy = true,
    keys = {
        '<F5>',
        '<F10>',
        '<F9>',
        '<F12>',
        '<leader>db',
        '<leader>lp',
        '<leader>dl',
        '<leader>dh',
    },
    config = function()
        local dapui = require('dapui')
        local dap = require('dap')

        dapui.setup()
        --- Keybinds
        vim.keymap.set('n', '<F5>', function() dap.continue() end)
        vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        vim.keymap.set('n', '<F9>', function() dap.step_into() end)
        vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>lp',
            function()
                dap.set_breakpoint(
                    nil,
                    nil,
                    vim.fn.input('Log point message: ')
                )
            end
        )
        vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>dh',
            function() require('dap.ui.widgets').hover() end
        )

        -- Open Dapui automaticly
        dap.listeners.before.event_initialized['dapui_configs'] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_configs'] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited['dapui_configs'] = function()
            dapui.close()
        end
    end,
    dependencies = { 'mfussenegger/nvim-dap' }
}
