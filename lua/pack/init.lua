vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
require("pack.add")
require("pack.mason")
require("pack.telescope")
