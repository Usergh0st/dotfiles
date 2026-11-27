-- ░█░░░█░█░█▀█░█░░░▀█▀░█▀█░█▀▀
-- ░█░░░█░█░█▀█░█░░░░█░░█░█░█▀▀
-- ░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:26 A.M.
-- Description - A blazing fast and easy to configure neovim statusline plugin.

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    name = "lualine",

    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {},
                statusline = {},
                winbar = {},
            }
        })
    end,
}
