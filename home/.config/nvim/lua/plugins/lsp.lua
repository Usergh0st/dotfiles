-- ░█░░░█▀▀░█▀█
-- ░█░░░▀▀█░█▀▀
-- ░▀▀▀░▀▀▀░▀░░

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:17 A.M.
-- Description - Language server protocol that helps you to code.

return {
    'neovim/nvim-lspconfig',
    name = "lspconfig",
    priority = 1000,

    config = function()
        local languages = {
            "lua_ls",
            "bashls",
            "zsh",
            "markdown"
        }

        for _, language in ipairs(languages)do
            vim.lsp.enable(language)
        end
    end,
}
