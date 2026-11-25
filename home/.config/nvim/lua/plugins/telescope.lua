-- ░▀█▀░█▀▀░█░░░█▀▀░█▀▀░█▀▀░█▀█░█▀█░█▀▀
-- ░░█░░█▀▀░█░░░█▀▀░▀▀█░█░░░█░█░█▀▀░█▀▀
-- ░░▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░░░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:20 A.M.
-- Description - Find and filter, preview and pick, all lua, all the time.

return {
    'nvim-telescope/telescope.nvim', version = '*',
    priority = 1000,
    lazy = false,

    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
        'sharkdp/fd',
        'nvim-tree/nvim-web-devicons'
    },

    -- All the keymaps are here
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Close telescope' })
        vim.keymap.set('n', '<leader>m', '<cmd>Alpha<CR>', { desc = 'Open alpha menu' })
    end,
}
