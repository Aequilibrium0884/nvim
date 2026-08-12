local mason_python = vim.fn.expand("~/.local/share/mason-python/bin")
vim.env.PATH = mason_python .. ":" .. vim.env.PATH

require("config")
require("pack")
require("mini")
vim.cmd([[ colorscheme onedark ]])
