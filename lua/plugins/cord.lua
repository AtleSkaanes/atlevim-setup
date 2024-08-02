return {
    'vyfor/cord.nvim',
    build = '.\\build',
    lazy = true,
    event = 'VeryLazy',
    opts = {
        idle = {
            enable = true, -- Enable idle status
            show_status = true, -- Display idle status, disable to hide the rich presence on idle
            timeout = 1800000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
            disable_on_focus = true, -- Do not display idle status when neovim is focused
            text = 'Idle', -- Text to display when idle
            tooltip = '💤', -- Text to display when hovering over the idle image
        },
    },
}
