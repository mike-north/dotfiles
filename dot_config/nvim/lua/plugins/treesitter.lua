-- ============================================================================
-- Treesitter Configuration
-- ============================================================================
-- Treesitter provides advanced syntax highlighting, code navigation,
-- and text object support for many languages.
-- ============================================================================

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Languages to install
        ensure_installed = {
          -- Web development
          "typescript",
          "tsx",
          "javascript",
          "html",
          "css",
          "scss",
          "json",
          "jsonc",

          -- Backend / Systems
          "lua",
          "python",
          "rust",
          "go",
          "c",
          "cpp",

          -- Config / Data
          "yaml",
          "toml",
          "xml",

          -- Shell / Terminal
          "bash",
          "fish",

          -- Documentation
          "markdown",
          "markdown_inline",

          -- Version control
          "git_config",
          "gitcommit",
          "gitignore",
          "diff",

          -- Query language
          "graphql",
          "sql",

          -- Vim specific
          "vim",
          "vimdoc",
          "query", -- Treesitter query language
        },

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        -- Syntax highlighting
        highlight = {
          enable = true,
          -- Disable for very large files
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },

        -- Indentation based on treesitter
        indent = {
          enable = true,
        },

        -- Incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",    -- Start selection
            node_incremental = "<C-space>",  -- Expand to next node
            scope_incremental = false,        -- Disabled
            node_decremental = "<bs>",        -- Shrink selection
          },
        },

        -- Text objects for functions, classes, etc.
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Jump forward to textobj

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = { query = "@function.outer", desc = "Select around function" },
              ["if"] = { query = "@function.inner", desc = "Select inside function" },
              ["ac"] = { query = "@class.outer", desc = "Select around class" },
              ["ic"] = { query = "@class.inner", desc = "Select inside class" },
              ["aa"] = { query = "@parameter.outer", desc = "Select around argument" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inside argument" },
              ["ai"] = { query = "@conditional.outer", desc = "Select around conditional" },
              ["ii"] = { query = "@conditional.inner", desc = "Select inside conditional" },
              ["al"] = { query = "@loop.outer", desc = "Select around loop" },
              ["il"] = { query = "@loop.inner", desc = "Select inside loop" },
            },
          },

          move = {
            enable = true,
            set_jumps = true, -- Add to jumplist

            goto_next_start = {
              ["]f"] = { query = "@function.outer", desc = "Next function start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              ["]a"] = { query = "@parameter.inner", desc = "Next argument" },
            },
            goto_next_end = {
              ["]F"] = { query = "@function.outer", desc = "Next function end" },
              ["]C"] = { query = "@class.outer", desc = "Next class end" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@function.outer", desc = "Previous function start" },
              ["[c"] = { query = "@class.outer", desc = "Previous class start" },
              ["[a"] = { query = "@parameter.inner", desc = "Previous argument" },
            },
            goto_previous_end = {
              ["[F"] = { query = "@function.outer", desc = "Previous function end" },
              ["[C"] = { query = "@class.outer", desc = "Previous class end" },
            },
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next argument" },
            },
            swap_previous = {
              ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous argument" },
            },
          },
        },
      })
    end,
  },
}

