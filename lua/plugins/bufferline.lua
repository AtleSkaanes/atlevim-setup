return {
    'akinsho/bufferline.nvim',
    version = '*',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    highlight = 'Directory',
                    text_align = 'center',
                },
                {
                    filetype = 'Outline',
                    text = 'Symbol Outline',
                    highlight = 'Directory',
                    text_align = 'center',
                },
                {
                    filetype = 'undotree',
                    text = 'Undo Tree',
                    highlight = 'Directory',
                    text_align = 'center'

                }
            },
            show_buffer_close_icons = false,
            show_close_icon = false,
            sort_by = "insert_after_current",
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level)
                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
        },
    },
    init = function()
        vim.opt.termguicolors = true
        vim.keymap.set('n', '<C-right>', '<cmd> BufferLineCycleNext <CR>')
        vim.keymap.set('n', '<C-left>', '<cmd> BufferLineCyclePrev <CR>')
        vim.keymap.set('n', '<C-w>', '<cmd> bdelete! <CR>')
    end,
}
