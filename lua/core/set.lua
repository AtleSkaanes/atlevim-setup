
--- Line numbers ---
vim.opt.nu = true
vim.opt.relativenumber = true

--- Tabs ---
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

--- Fake newline ---
vim.opt.wrap = false

--- Better undotree ---
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

--- colors
vim.opt.termguicolors = true

--- Scroll config
vim.opt.scrolloff = 8
vim.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--- Fast update time
vim.opt.updatetime = 250

--- Color column
vim.opt.colorcolumn = "80"

