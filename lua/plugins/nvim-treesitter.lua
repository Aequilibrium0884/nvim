return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",

		config = function()
			local ts = require("nvim-treesitter")

			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local parsers = {
				"bash",
				"c",
				"cpp",
				"lua",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"vimdoc",
				"go",
				"rust",
				"java",
				"markdown",
				"markdown_inline",
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
