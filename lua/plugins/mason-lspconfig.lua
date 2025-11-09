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
				"cmake",
				"marksman",
				"nginx_language_server",
				"dockerls",
				"systemd_ls",
				"docker_compose_language_service",
			},
		})
	end,
}
