return {
  "2KAbhishek/nerdy.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").load_extension("nerdy")
    vim.keymap.set("n", "<leader>sn", "<cmd>Telescope nerdy<CR>", { desc = "Pick Nerd Font glyph" })
  end,
}
