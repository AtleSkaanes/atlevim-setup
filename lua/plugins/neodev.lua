return {
    'folke/neodev.nvim',
    main = 'neodev',
    lazy = true,
    event = { 'LspAttach' },
    opts = {
        library = {
            enabled = true,
            runtime = true,
            types = true,
            plugins = true
        },
        override = function(root_dir, options) end,
        lspconfig = true,
        pathStrict = true
    }
}