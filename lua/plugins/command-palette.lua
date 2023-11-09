return {
    'AtleSkaanes/command-palette.nvim',
    main = 'command-palette',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        commands = {
            {
                name = 'print test',
                category = 'print',
                cmd = 'test'
            },
            {
                name = 'print yes',
                category = 'print',
                cmd = 'yes'
            },
        }
    }
}
