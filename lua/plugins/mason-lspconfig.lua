return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    auto_install = true,
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ansiblels",
        "ts_ls",
        "html",
        "lua_ls",
        "cssls",
        "bashls",
        "pyright",
        "jsonls",
        "clangd",
        "rust_analyzer",
        "vimls",
        "gopls",
        "marksman",
        "dockerls",
        "systemd_lsp",
        "docker_compose_language_service",
        "postgres_lsp",
      },
    })
  end,
}
