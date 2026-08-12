local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist,
			},
		},
	},
	pickers = {},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
vim.keymap.set("n", "<leader>ef", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>eg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>eb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>eh", builtin.help_tags, { desc = "Telescope help tags" })
