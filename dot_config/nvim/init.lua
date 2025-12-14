-- ============================================================================
-- Neovim Configuration
-- ============================================================================
-- A beginner-friendly config with modern defaults, syntax highlighting,
-- and TypeScript language server support.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Basic Options
-- ----------------------------------------------------------------------------

-- Line numbers
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers for easier navigation

-- Indentation
vim.opt.tabstop = 2           -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2        -- Number of spaces for autoindent
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Smart autoindenting

-- Search
vim.opt.ignorecase = true     -- Ignore case when searching
vim.opt.smartcase = true      -- Unless uppercase is used
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Show matches as you type

-- Visual
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.cursorline = true     -- Highlight current line
vim.opt.signcolumn = "yes"    -- Always show sign column (for git/diagnostics)
vim.opt.scrolloff = 8         -- Keep 8 lines above/below cursor
vim.opt.colorcolumn = "100"   -- Show column guide at 100 chars

-- Behavior
vim.opt.mouse = "a"           -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.splitbelow = true     -- Horizontal splits below current window
vim.opt.splitright = true     -- Vertical splits to the right
vim.opt.undofile = true       -- Persistent undo history
vim.opt.updatetime = 250      -- Faster completion
vim.opt.timeoutlen = 300      -- Faster key sequence completion

-- Disable netrw (we'll use other file explorers)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ----------------------------------------------------------------------------
-- Key Mappings
-- ----------------------------------------------------------------------------

-- Set leader key to space (very common choice)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation (Ctrl + h/j/k/l to move between splits)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search highlighting with Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Better indenting in visual mode (stay in visual mode after indent)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and stay in visual" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and stay in visual" })

-- Move lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Quick quit
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- ----------------------------------------------------------------------------
-- Plugin Manager (lazy.nvim)
-- ----------------------------------------------------------------------------

-- Bootstrap lazy.nvim (auto-install if not present)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins", {
  -- Automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false, -- Don't notify on startup
  },
  -- Don't notify about config changes
  change_detection = {
    notify = false,
  },
})

