return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      css = { rgb_fn = true },
      html = { names = false },
      lua = { names = false },
    })
  end,

}
