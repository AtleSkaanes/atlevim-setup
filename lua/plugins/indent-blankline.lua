return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
}
