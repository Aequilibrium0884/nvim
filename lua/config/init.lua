require("config.keymaps")
require("config.options")
require("config.lazy")

local ok, notify = pcall(require, "notify")
if ok then
  notify.setup({
    background_colour = "#000000", -- black background (or any RGB hex)
  })
  vim.notify = notify
end

