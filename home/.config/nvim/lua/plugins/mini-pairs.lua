-- ░█▄█░▀█▀░█▀█░▀█▀
-- ░█░█░░█░░█░█░░█░
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀

-- ░█▀█░█▀█░▀█▀░█▀▄░█▀▀
-- ░█▀▀░█▀█░░█░░█▀▄░▀▀█
-- ░▀░░░▀░▀░▀▀▀░▀░▀░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:26 A.M.
-- Description - Auto completion of braces, parentheses, among other things.

return {
    "nvim-mini/mini.pairs", 
    version = false,

    config = function()
        require("mini.pairs").setup()
    end,
}
