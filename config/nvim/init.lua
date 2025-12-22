-- ==========================================================================
-- 1. CORE SETTINGS
-- ==========================================================================
vim.g.mapleader = " "

-- Ergonomics & Formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.backspace = "indent,eol,start"
vim.opt.wrap = false
vim.opt.scrolloff = 10 

-- System
vim.opt.clipboard = "unnamedplus" -- System clipboard
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true

-- UI (Accessibility/Deutan)
vim.opt.cursorline = true 
vim.opt.signcolumn = "yes" -- Prevent text shift
vim.opt.laststatus = 3     -- Global statusline
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- ==========================================================================
-- 2. PLUGINS & THEME
-- ==========================================================================
require("lazy").setup({
  
-- THEME: Forced match with Kitty colors (Deutan Optimized)
  { 
    "miikanissi/modus-themes.nvim", 
    priority = 1000,
    config = function()
      require("modus-themes").setup({
        style = "modus_operandi", 
        variant = "tinted",
        
        -- OVERRIDE: Force exact HEX codes from your kitty.conf
        on_highlights = function(highlights, colors)
          return {
            -- 1. BACKGROUND & TEXT (Exact match to Kitty)
            Normal = { fg = "#0a0a0a", bg = "#fbf7f0" }, 
            NormalFloat = { fg = "#0a0a0a", bg = "#fbf7f0" },
            SignColumn = { bg = "#fbf7f0" }, 
            
            -- 2. SYNTAX: BOLD BLACK (Structure)
            -- We strip colors to reduce noise, using Bold for logic
            Keyword = { fg = "#000000", bold = true },
            Statement = { fg = "#000000", bold = true },
            Function = { fg = "#000000", bold = true },
            Type = { fg = "#000000", bold = true },
            Operator = { fg = "#000000" },
            Identifier = { fg = "#0a0a0a" }, -- Variables (Plain black)
            
            -- 3. THE "ANCHOR" COLOR (Blue #005faf)
            -- This matches your Kitty URL/Folder color exactly.
            String = { fg = "#005faf" }, 
            Constant = { fg = "#005faf", bold = true }, -- Numbers/Booleans
            Special = { fg = "#005faf" },               -- Regex/Escapes
            
            -- 4. COMMENTS (Gray #595959)
            Comment = { fg = "#595959", italic = true },

            -- 5. UI & SELECTION
            LineNr = { fg = "#a0a0a0" },
            CursorLineNr = { fg = "#000000", bold = true },
            -- Sand/Yellow background for selection (High contrast against Blue)
            Visual = { bg = "#f5d0a9", fg = "#000000" },
            Search = { bg = "#efc535", fg = "#000000" },
            
            -- 6. SPLIT BORDERS (Seamless look)
            VertSplit = { fg = "#a0a0a0", bg = "#fbf7f0" },
            WinSeparator = { fg = "#a0a0a0", bg = "#fbf7f0" },

            -- 7. GIT / NEOGIT (Symbols + Safe Colors)
            -- Added/Changed = Blue Text
            DiffAdd = { fg = "#005faf", bg = "#e8f0f8" },
            NeogitDiffAdd = { fg = "#005faf", bg = "#e8f0f8", bold = true },
            -- Deleted = Gray Strikethrough
            DiffDelete = { fg = "#808080", strikethrough = true },
            NeogitDiffDelete = { fg = "#808080", bg = "#f0f0f0", strikethrough = true },
          }
        end
      })
      vim.cmd("colorscheme modus_operandi")
    end
  },

  -- UI COMPONENTS
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  
  -- GIT: Neogit (Magit clone)
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("neogit").setup({
        graph_style = "ascii", 
        integrations = { diffview = true },
        signs = { section = { " >", " v" }, item = { " >", " v" }, hunk = { "", "" } },
      })
    end,
  },
  
  -- GIT: Margins (Symbols only)
  { 
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        numhl = false, -- No line highlighting
        linehl = false, 
      })
    end
  },

  -- SRE TOOLS (LSP, Treesitter, Mason)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { 
    "williamboman/mason.nvim", 
    dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
    config = function()
       -- Diagnostics: Letters instead of colored dots
       vim.fn.sign_define('DiagnosticSignError', { text = 'E', texthl = 'DiagnosticSignError' })
       vim.fn.sign_define('DiagnosticSignWarn', { text = 'W', texthl = 'DiagnosticSignWarn' })
       vim.fn.sign_define('DiagnosticSignHint', { text = 'H', texthl = 'DiagnosticSignHint' })
       vim.fn.sign_define('DiagnosticSignInfo', { text = 'I', texthl = 'DiagnosticSignInfo' })

       require("mason").setup()
       require("mason-lspconfig").setup({
         ensure_installed = { "gopls", "yamlls", "pyright", "tflint" },
         handlers = {
           function(server_name) require("lspconfig")[server_name].setup({}) end,
         }
       })
    end
  },

  -- EDITING
  { "numToStr/Comment.nvim", config = true },
  { "tpope/vim-surround" },
  { "preservim/tagbar" },
})

-- ==========================================================================
-- 3. KEYMAPS
-- ==========================================================================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Git (Neogit)
keymap("n", "<leader>gg", ":Neogit<CR>", { desc = "Neogit (Magit style)" }) 
keymap("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Diffview (Side-by-side)" })
keymap("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Close Diffview" })

-- Files & Search (Telescope)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find File" })
keymap("n", "<leader>/", ":Telescope live_grep<CR>", { desc = "Grep Files" })
keymap("n", "<leader>bb", ":Telescope buffers<CR>", { desc = "Buffers" })
keymap("n", "<leader>h", ":noh<CR>", { desc = "Clear Highlight" })

-- Windows & Buffers
keymap("n", "<leader>bd", ":bd<CR>", { desc = "Close Buffer" })
keymap("n", "<leader>wd", ":q<CR>", { desc = "Close Window" })
keymap("n", "<leader>wc", ":cope<CR>", { desc = "Quickfix" })

-- Tabs
keymap("n", "<leader>tc", ":tabnew<CR>", { desc = "New Tab" })
keymap("n", "<leader>tn", ":tabnext<CR>", { desc = "Next Tab" })
keymap("n", "<leader>tp", ":tabprevious<CR>", { desc = "Prev Tab" })

-- Utils
keymap("n", "<leader>tt", ":TagbarToggle<CR>", { desc = "Tagbar" })
keymap("n", "<leader>d", vim.lsp.buf.hover, { desc = "LSP Hover" })
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to Def" })

-- Which-Key Groups
local wk = require("which-key")
wk.add({
  { "<leader>b", group = "Buffers" },
  { "<leader>f", group = "Files" },
  { "<leader>g", group = "Git" },
  { "<leader>t", group = "Tabs" },
  { "<leader>w", group = "Windows" },
})
