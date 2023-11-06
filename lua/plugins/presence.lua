return {
    'AtleSkaanes/presence.nvim',
    main = 'presence',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        show_time = false,
    }
}
