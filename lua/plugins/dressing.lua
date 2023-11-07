return {
    'stevearc/dressing.nvim',
    main = 'dressing',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        backend = { 'telescope' },
    }
}
