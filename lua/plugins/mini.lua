return {
	-- lazy.nvim example
	"echasnovski/mini.nvim",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 100,
				symbol = "╎",
				priority = 2,
			},
			mappings = {
				object_scope = "ii",
				goto_top = "[i",
				goto_bottom = "]i",
			},
			options = {
				border = "both",
				indent_at_cursor = true,
				n_lines = 10000,
			},
		})
		require("mini.surround").setup()
		require("mini.comment").setup()
	end,
}
