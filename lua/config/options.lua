vim.o.mouse = ""
vim.o.number = true
vim.o.relativenumber = true

vim.opt.signcolumn = 'yes'

vim.o.cursorline = true

vim.o.list = true
vim.opt.listchars = {
	eol = '↵',
	tab = '» ',
	--trail= "·",
	multispace = '···|',
	--lead = '.',
	nbsp = '␣',
	--precedes = '#',
}
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#433333" })

vim.opt.inccommand = 'split'

vim.opt.wrap = true
vim.opt.breakindent = true

--vim.opt.expandtab = true
--vim.opt.tabstop = 8
--vim.opt.softtabstop = 8
--vim.opt.shiftwidth = 8

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.undofile = true
