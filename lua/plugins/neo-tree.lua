return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim",
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
		vim.keymap.set("n", "<leader><leader>", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
		require("transparent").clear_prefix("Neotree")
	end,
}
