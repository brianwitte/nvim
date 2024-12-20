-- IMPORTANT SETTINGS
vim.opt.syntax = "on"

-- COLORS AND FONTS
vim.opt.guifont = "Source Code Pro"
vim.g.base16colorspace = 256
vim.opt.termguicolors = true
vim.cmd("colorscheme jellybeans")

-- Setup leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- TRANSPARENCY TOGGLE
local transparent = false
function ToggleTransparency()
    transparent = not transparent
    if transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "NONE" })
    else
        vim.cmd("highlight clear Normal")
    end
end
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua ToggleTransparency()<CR>", { noremap = true, silent = true })

-- VISUALS AND UI
vim.opt.wildmenu = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.culopt = "number"
vim.opt.colorcolumn = "96"
vim.opt.clipboard:append("unnamedplus")
vim.opt.laststatus = 2
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "VertSplit", { cterm = "NONE", gui = "NONE" })
    end,
})
vim.opt.scrolloff = 7
vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- BEHAVIOURS
vim.opt.history = 500
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Save with sudo
vim.api.nvim_create_user_command("W", function()
    vim.cmd("execute 'w !sudo tee % > /dev/null' | edit!")
end, {})

vim.env.LANG = "en"

-- Disable backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.linebreak = true
vim.opt.textwidth = 500
vim.opt.wrap = true

-- FILETYPE SPECIFICS
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "latex" },
    callback = function()
        vim.opt_local.textwidth = 80
    end,
})

-- Wildignore
if vim.fn.has("win32") == 1 then
    vim.opt.wildignore:append({ ".git\\*", ".hg\\*", ".svn\\*" })
else
    vim.opt.wildignore:append({ "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" })
end
vim.opt.wildignore:append({ "*.o", "*~", "*.pyc" })

-- Disable error bells
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.timeoutlen = 500

-- Auto-remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.cmd([[ %s/\s\+$//e ]])
    end,
})

-- MAPPINGS
vim.api.nvim_set_keymap("n", "\\", "<NOP>", {})
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", {})
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", {})
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", {})
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", {})
vim.api.nvim_set_keymap("t", "kj", "<C-\\><C-n>", {})

-- Clipboard toggle
local clipboard_synced = true
function ToggleClipboard()
    clipboard_synced = not clipboard_synced
    if clipboard_synced then
        vim.opt.clipboard:append("unnamedplus")
    else
        vim.opt.clipboard:remove("unnamedplus")
    end
    print("Clipboard " .. (clipboard_synced and "enabled" or "disabled"))
end
vim.api.nvim_set_keymap("n", "<leader>tc", ":lua ToggleClipboard()<CR>", { noremap = true, silent = true })

-----------------------------------------
--         _             _             --
--        | |           (_)            --
--   _ __ | |_   _  __ _ _ _ __  ___   --
--  | '_ \| | | | |/ _` | | '_ \/ __|  --
--  | |_) | | |_| | (_| | | | | \__ \  --
--  | .__/|_|\__,_|\__, |_|_| |_|___/  --
--  | |             __/ |              --
--  |_|            |___/               --
-----------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Install and configure plugins
require("lazy").setup({
  spec = {
    -- Keybinding helper
    { "folke/which-key.nvim" },

    -- Icons for better UI
    { "nvim-tree/nvim-web-devicons" },

    -- LSP support
    { "neovim/nvim-lspconfig" },
    { "glepnir/lspsaga.nvim" },
    { "folke/lsp-trouble.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },

    -- File and buffer navigation
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Treesitter for syntax highlighting and symbols
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Comments
    { "tpope/vim-commentary" },

    -- Git integration
    { "tpope/vim-fugitive" },
  },
  checker = {
    enabled = true, -- Enables background checking for updates
    notify = false, -- Suppress notifications
    frequency = 86400, -- Check for updates once per day (in seconds)
  },
})

local wk = require("which-key")

wk.add({
  -- File operations
  { "<leader>f", group = "File" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fs", "<cmd>w<cr>", desc = "Save File" },

  -- Search operations
  { "<leader>s", group = "Search" },
  { "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in Current File" },
  { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search in Project" },
  { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps" },
  { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Search Registers" },

  -- Buffer operations
  { "<leader>b", group = "Buffer" },
  { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Switch Buffer" },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Kill Buffer" },
  { "<leader>bi", "<cmd>Telescope buffers<cr>", desc = "Buffer List" },

  -- Commands
  { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Execute Command" },

  -- Downcase
  { "<leader>d", group = "Downcase" },
  { "<leader>dl", "vipgu", desc = "Downcase Line" },

  -- Project management
  { "<leader>p", group = "Project" },
  { "<leader>p ", "<cmd>Telescope find_files<cr>", desc = "Find File in Project" },
  { "<leader>pp", "<cmd>Telescope projects<cr>", desc = "Switch Project" },
  { "<leader>pr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  { "<leader>pb", "<cmd>Telescope buffers<cr>", desc = "Project Buffers" },
  { "<leader>pd", "<cmd>Telescope find_directories<cr>", desc = "Find Directory" },

  -- LSP bindings
  { "<leader>l", group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>lf", group = "Format" },
  { "<leader>lfb", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format Buffer" },
  { "<leader>lfr", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", desc = "Format Region" },
  { "<leader>lg", group = "Goto" },
  { "<leader>lgd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition" },
  { "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Find References" },
  { "<leader>lh", group = "Help" },
  { "<leader>lhd", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation" },

  -- Window management
  { "<leader>w", proxy = "<c-w>", group = "Window" },
  { "<leader>wq", "<cmd>q<cr>", desc = "Close Window" },
  { "<leader>wr", "<cmd>resize<cr>", desc = "Resize Window" },
  { "<leader>ws", "<cmd>split<cr>", desc = "Horizontal Split" },
  { "<leader>wv", "<cmd>vsplit<cr>", desc = "Vertical Split" },
  { "<leader>wh", "<c-w>h", desc = "Move Left" },
  { "<leader>wj", "<c-w>j", desc = "Move Down" },
  { "<leader>wk", "<c-w>k", desc = "Move Up" },
  { "<leader>wl", "<c-w>l", desc = "Move Right" },

  -- Comments
  { "<leader>;", "<cmd>Commentary<cr>", desc = "Toggle Comment" },

  -- Nested mappings for Visual mode
  {
    mode = { "v" },
    { "<leader>;", "<cmd>Commentary<cr>", desc = "Toggle Comment" },
    { "<leader>f", group = "Format" },
    { "<leader>fr", ":'<,'>center<cr>", desc = "Fill Region" },
  },
})
