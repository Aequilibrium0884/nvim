return {
	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-ts-autotag",
	branch = "main",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
		ts.install({
			"bash",
			"java",
			"javascript",
			"lua",
			"go",
			"python",
			"typescript",
			"html",
			"css",
			"json",
			"vimdoc",
			"ini",
			"ssh_config",
			"passwd",
			"diff",
			"regex",
			"yaml",
			"json",
			"json5",
			"toml",
			"xml",
			"csv",
			"dockerfile",
			"terraform",
			"hcl",
			"sql",
			"git_config",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"gitattributes",
		})
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
