return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 3,
    },
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
