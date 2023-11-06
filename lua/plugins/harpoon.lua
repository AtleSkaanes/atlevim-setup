return {
    'ThePrimeagen/harpoon',
    main = 'harpoon',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        tabline = true,
    },
    init = function()
        require("telescope").load_extension('harpoon')
        vim.keymap.set("n", "<C-left>", "<cmd>lua require('harpoon.ui').nav_prev()<CR>")
        vim.keymap.set("n", "<C-right>", "<cmd>lua require('harpoon.ui').nav_next()<CR>")
        vim.keymap.set("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
        vim.keymap.set("n", "<A-s>", "<cmd>lua require('harpoon.mark').add_file()<CR>")
        vim.keymap.set("n", "<A-t>", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>")
    end
}
