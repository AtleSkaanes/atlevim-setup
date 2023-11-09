return {
    'numToStr/Comment.nvim',
    main = 'Comment',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        padding = true,
        sticky = true,
        toggler = {
            line = 'gcc',
            block = 'gbc',
        },
        opleader = {
            line = 'gc',
            block = 'gb',
        },
    }
}
