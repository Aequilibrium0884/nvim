vim.opt.number = true
vim.opt.scrolloff = 999
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.fillchars = { eob = " " }
vim.opt.shortmess:append("I")
vim.opt.virtualedit = "block"
vim.diagnostic.config({
	virtual_text = true, -- inline errors
	signs = true, -- gutter icons
	update_in_insert = false, -- prevent distractions while typing
})
