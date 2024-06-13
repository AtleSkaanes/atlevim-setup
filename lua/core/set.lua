--- End of Buffer sign
vim.opt.fillchars = { eob = ' ' }

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
vim.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

--- Fast update time
vim.opt.updatetime = 250

--- Color column
vim.opt.colorcolumn = '80'

--- Background
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

--- Terminal to powershell
local powershell_options = {
    shell = vim.fn.executable('pwsh') == 1 and 'pwsh' or 'powershell',
    shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
    shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
    shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
    shellquote = '',
    shellxquote = '',
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

--- Hyperlinks
vim.cmd('set conceallevel=2')
