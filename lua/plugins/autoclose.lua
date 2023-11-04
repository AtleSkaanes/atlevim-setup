return {
    'm4xshen/autoclose.nvim',
    main = 'autoclose',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        disable_when_touch = true
    },
}

