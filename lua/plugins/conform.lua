return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true
    },
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      go = {
        "gofumpt",
        "goimports",
        "golines"
      },
      sh = { "shfmt" },
      bash = { "shfmt" },
      python = { "ruff", "black" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      sql = { "sqlruff" },
    },
  },
}
