local ts = require("nvim-treesitter")

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
  "bash",
  "java",
  "javascript",
  "lua",
  "go",
  "python",
  "typescript",
  "html",
  "css",
  "json",
  "vimdoc",
  "ini",
  "ssh_config",
  "passwd",
  "diff",
  "regex",
  "yaml",
  "json5",
  "toml",
  "xml",
  "csv",
  "dockerfile",
  "terraform",
  "hcl",
  "sql",
  "git_config",
  "git_rebase",
  "gitcommit",
  "gitignore",
  "gitattributes",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.treesitter.language.register("ini", { "podman" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "podman" },
  callback = function()
    vim.treesitter.start()
  end,
})

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
