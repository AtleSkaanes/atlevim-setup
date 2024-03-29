return {
    'samodostal/image.nvim',
    main = 'image',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'm00qek/baleia.nvim',
    },
    opts = {
        render = {
            min_padding = 5,
            show_label = true,
            show_image_dimensions = true,
            use_dither = true,
            foreground_color = true,
            background_color = true,
        },
        events = {
            update_on_nvim_resize = true,
        },
    },
}
