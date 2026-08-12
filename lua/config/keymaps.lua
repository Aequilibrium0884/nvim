vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<leader>f", "F")
vim.keymap.set({ "n", "v" }, "<leader>h", "^")
vim.keymap.set({ "n", "v" }, "<leader>l", "g_")
vim.keymap.set({ "n", "v" }, "<leader>k", "gg")
vim.keymap.set({ "n", "v" }, "<leader>j", "G")
vim.keymap.set({ "n", "v" }, "<leader>v", "V")
vim.keymap.set({ "n", "v" }, "<leader>m", "%")

vim.keymap.set("n", "<leader><leader>", ":Neotree toggle<CR>", {
	desc = "Toggle Neo-tree",
})
