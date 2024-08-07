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
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
        local dapui = require('dapui')
        local dap = require('dap')

        dapui.setup()
        --- Keybinds
        vim.keymap.set('n', '<F5>', function() dap.continue() end)
        vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        vim.keymap.set('n', '<F9>', function() dap.step_into() end)
        vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        vim.keymap.set(
            'n',
            '<Leader>db',
            function() dap.toggle_breakpoint() end
        )
        vim.keymap.set('n', '<Leader>lp', function()
            vim.ui.input(
                { prompt = 'Log point message: ' },
                function(input) dap.set_breakpoint(nil, nil, input) end
            )
        end)
        vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
        vim.keymap.set(
            { 'n', 'v' },
            '<Leader>dh',
            function() require('dap.ui.widgets').hover() end
        )

        vim.fn.sign_define('DapBreakpoint', {
            text = '',
            linehl = 'DapBreakpointLine',
            texthl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        })
        vim.fn.sign_define('DapBreakpointCondition', {
            text = '',
            linehl = 'DapBreakpointLine',
            texthl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        })
        vim.fn.sign_define('DapBreakpointRejected', {
            text = '',
            linehl = 'DapBreakpointLine',
            texthl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        })
        vim.fn.sign_define('DapLogPoint', {
            text = '',
            linehl = 'DapLogPointLine',
            texthl = 'DapLogPoint',
            numhl = 'DapLogPoint',
        })
        vim.fn.sign_define('DapStopped', {
            text = '',
            linehl = 'DapStoppedLine',
            texthl = 'DapStopped',
            numhl = 'DapStopped',
        })

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
        --- configurations and adapters
        -- Update this path
        local mason_registry = require('mason-registry')
        local codelldb = mason_registry.get_package('codelldb')
        local codelldb_path
        local liblldb_path

        local this_os = vim.loop.os_uname().sysname
        if this_os:find('Windows') then
            local extension_path = codelldb:get_install_path() .. '\\extension'
            codelldb_path = extension_path .. '\\adapter\\codelldb.exe'
            liblldb_path = extension_path .. '\\lldb\\bin\\liblldb.dll'
        else
            local extension_path = codelldb:get_install_path() .. '/extension'
            codelldb_path = extension_path .. '/adapter/codelldb'
            liblldb_path = extension_path .. '/lldb/bin/liblldb'
            liblldb_path = liblldb_path
                .. (this_os == 'Linux' and '.so' or '.dylib')
        end

        dap.adapters.codelldb = {
            type = 'server',
            port = '${port}',
            host = '127.0.0.1',
            executable = {
                command = codelldb_path,
                args = { '--liblldb', liblldb_path, '--port', '${port}' },

                detached = false,
            },
        }
        dap.configurations.cpp = {
            {
                name = 'Launch',
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input(
                        'Path to executable: ',
                        vim.fn.getcwd() .. '/',
                        'file'
                    )
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }
        -- If you want to use this for C, add something like this:
        dap.configurations.c = dap.configurations.cpp
    end,
}
