return {
    'nvim-tree/nvim-web-devicons',
    main = 'nvim-web-devicons',
    opts = {
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh"
            }
        },
        color_icons = true,
        default = true,
        strict = false,
        override_by_filename = {
            [".gitignore"] = {
                icon = "",
                color = "#f1502f",
            }
        },
        override_by_extension = {
            ["log"] = {
                icon = "",
                color = "#81e043",
                name = "Log"
            }
        }
    },
}

