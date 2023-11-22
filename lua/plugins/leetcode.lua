local leet_arg = 'leetcode.nvim'

return {
    'kawre/leetcode.nvim',
    main = 'leetcode',
    lazy = leet_arg ~= vim.fn.argv()[1],
    build = ':TSUpdate html',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim', -- required by telescope
        'MunifTanjim/nui.nvim',

        -- optional
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        lang = 'rust',
        arg = leet_arg,
    },
}
