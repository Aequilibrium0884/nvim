return {
	"mfussenegger/nvim-lint",
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
			json = { "jsonlint", "json5" },
			lua = { "luacheck" },
			zsh = { "zsh" },
		}
	end,
}
