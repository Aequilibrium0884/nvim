require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},

	pip = {
		upgrade_pip = true,
	},
})

require("mason-lspconfig").setup({

	ensure_installed = {
		"lua_ls",
		"bashls",
		"ansiblels",
		"cssls",
		"dockerls",
		"gopls",
		"html",
		"htmx",
		"hyprls",
		"jsonls",
		"nginx_language_server",
		"postgres_lsp",
		"pyright",
		"sqlls",
		"systemd_lsp",
		"tailwindcss",
		"templ",
		"ts_ls",
		"vimls",
		"yamlls",
	},

	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason.nvim",
	},
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
require("transparent").clear_prefix("lualine")
