return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<M-\>]], -- press Ctrl+\ to toggle
			direction = "float",
			start_in_insert = true,
			close_on_exit = true,
			shell = vim.o.shell,

			float_opts = {
				border = "curved",
				width = function()
					return math.floor(vim.o.columns * 0.90) -- 90% of editor width
				end,
				height = function()
					return math.floor(vim.o.lines * 0.85) -- 85% of editor height
				end,
				col = function()
					local w = math.floor(vim.o.columns * 0.90)
					return math.floor((vim.o.columns - w) / 2) -- center horizontally
				end,
				row = function()
					local h = math.floor(vim.o.lines * 0.85)
					return math.floor((vim.o.lines - h) / 2) -- center vertically
				end,
				winblend = 0,
				title_pos = "center",
			},
		})
	end,
}
