-- ░█▀▀░█▄█░█▀█
-- ░█░░░█░█░█▀▀
-- ░▀▀▀░▀░▀░▀░░

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:25 A.M.
-- Description - A completion plugin for neovim coded in Lua.

return {
    'hrsh7th/nvim-cmp',
    name = "nvim-cmp",
    priority = 1000,
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },

    config = function()
        local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }),
        })
    end,
}
