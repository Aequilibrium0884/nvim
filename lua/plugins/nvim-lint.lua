return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      ansible = { "ansible_lint" },
      docker = { "hadolint" },
      systemd = { "systemdlint" },
      bash = { "bash" },
      sh = { "shellcheck" },
      go = { "golangci-lint" },
      sql = { "postgres_lsp" },
    }

    -- run lint on save
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
