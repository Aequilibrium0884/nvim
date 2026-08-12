vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/HiPhish/rainbow-delimiters.nvim",
	"https://github.com/nvim-telescope/telescope.nvim.git",

	"https://github.com/rafamadriz/friendly-snippets",

	"https://github.com/nvim-telescope/telescope-ui-select.nvim.git",
	"https://github.com/L3MON4D3/LuaSnip",
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	{
		src = "https://github.com/nvim-mini/mini.nvim",
		version = "stable",
	},
	{
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
})
require("notify").setup({})
require("rainbow-delimiters.setup").setup({})
require("luasnip.loaders.from_vscode").lazy_load()
