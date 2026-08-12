return {
	-- Using Lazy
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- Lua
		require("onedark").setup({
			style = "deep",
			transparent = true,
			term_colors = true,
			ending_tildes = false,
			cmp_itemkind_reverse = false,

			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			lualine = {
				transparent = true,
			},
			colors = {},
			highlights = {},
			diagnostics = {
				darker = true,
				undercurl = true,
				background = true,
			},
		})
		require("onedark").load()
	end,
}
