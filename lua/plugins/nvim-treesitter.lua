-- File: lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = '0.10.0', -- always use latest
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag",     -- HTML/JSX auto tags
      "nvim-treesitter/playground", -- optional (TSPlaygroundToggle)
    },
    config = function()
      -- parser list
      local parsers = {
        "bash",
        "c",
        "cpp",
        "lua",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "vim",
        "go",
        "rust",
        "java",
        "markdown",
      }

      require("nvim-treesitter.configs").setup({
        -- parsers
        ensure_installed = parsers,
        sync_install = false,
        auto_install = true,
        ignore_install = {},

        -- highlight
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, bufnr)
            local max_filesize = 200 * 1024 -- 200 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
            if ok and stats and stats.size > max_filesize then
              return true
            end
            return false
          end,
        },

        -- indentation
        indent = {
          enable = true,
          disable = { "python" },
        },
        -- incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>ns",
            node_incremental = "<Leader>ns",
            scope_incremental = "<Leader>nc",
            node_decremental = "<Leader>nd",
          },
        },

        -- textobjects
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ao"] = "@block.outer",
              ["io"] = "@block.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_previous = {
              ["<leader>sP"] = "@parameter.inner",
            },
            swap_next = {
              ["<leader>sp"] = "@parameter.inner",
            },
          },
        },

        -- autotag (HTML, JSX)
        autotag = {
          enable = true,
        },

        -- playground (optional - visual inspect TS tree)
        playground = {
          enable = true,
          updatetime = 25,
          persist_queries = false,
        },

        -- refactor features
        refactor = {
          highlight_definitions = { enable = true },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },
        },
      })
    end,
  },
}
