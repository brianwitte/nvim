local M = {}


function M.setup_mappings(A)
    -- Key mappings for basic functionality
    vim.api.nvim_set_keymap('n', '<leader>qq', ':qa<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>qr', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

    -- Finding/saving files
    vim.api.nvim_set_keymap('n', '<leader><Space>', ':Telescope find_files<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>pf', ':Telescope find_files<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>.', ':Telescope file_browser<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope file_browser<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fs', ':w<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fS', ':w<Space>', { noremap = true, silent = true })

    -- Buffer management
    vim.api.nvim_set_keymap('n', '<leader>,', ':Telescope buffers<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bb', ':Telescope buffers<CR>', { noremap = true, silent = true })

    -- Search (and Replace)
    vim.api.nvim_set_keymap('n', '<leader>/', ':Telescope live_grep<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>sp', ':Telescope live_grep<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>sd', ':Telescope find_files search_dirs=<C-R>=expand("%:p:h")<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>sS', ':Telescope find_files search_dirs=<C-R>=input("Search Directory: ")<CR>', { noremap = true, silent = true })

    -- Scratch buffer
    vim.api.nvim_set_keymap('n', '<leader>bx', ':enew<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bS', ':enew<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>px', ':enew<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>pS', ':enew<CR>', { noremap = true, silent = true })

    -- Window management
    vim.api.nvim_set_keymap('n', '<leader>ws', ':split<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wv', ':vsplit<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wd', ':close<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wH', '<C-w>H', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wJ', '<C-w>J', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wK', '<C-w>K', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wL', '<C-w>L', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wu', ':undo<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wr', ':redo<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wo', ':only<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>wmm', ':wincmd _<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ww|', ':wincmd \\|<CR>', { noremap = true, silent = true })

    vim.api.nvim_set_keymap('n', '<leader>w_', ':wincmd _<CR>', { noremap = true, silent = true })
end

function M.setup()
    vim.g.mapleader = " "
    M.setup_mappings()
end


    return M
