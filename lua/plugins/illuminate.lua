return {
    'RRethy/vim-illuminate',
    main = 'illuminate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('illuminate').configure() end,
}
