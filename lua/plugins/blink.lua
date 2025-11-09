return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Cr>"] = { "accept", "fallback" },
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				snippets = {
					opts = {
						friendly_snippets = true, -- default
						extended_filetypes = {
							markdown = { "jekyll" },
							sh = { "shelldoc" },
							php = { "phpdoc" },
							cpp = { "unreal" },
						},
					},
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
}
