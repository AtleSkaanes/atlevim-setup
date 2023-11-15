vim.keymap.set(
    'n',
    '<F2>',
    function() require('rust-tools').debuggables.debuggables() end
)
