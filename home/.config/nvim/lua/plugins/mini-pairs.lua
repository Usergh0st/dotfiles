-- ░█▄█░▀█▀░█▀█░▀█▀
-- ░█░█░░█░░█░█░░█░
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀

-- ░█▀█░█▀█░▀█▀░█▀▄░█▀▀
-- ░█▀▀░█▀█░░█░░█▀▄░▀▀█
-- ░▀░░░▀░▀░▀▀▀░▀░▀░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 19.08.2026 07:50 P.M.
-- Description - Auto-completion of braces, parentheses, among other things.

return {
    "nvim-mini/mini.pairs", 
    version = false,

    config = function()
        require("mini.pairs").setup()
    end,
}
