-- ░█▄█░▀█▀░█▀█░▀█▀
-- ░█░█░░█░░█░█░░█░
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀

-- ░█▀█░█▀█░▀█▀░█▀▄░█▀▀
-- ░█▀▀░█▀█░░█░░█▀▄░▀▀█
-- ░▀░░░▀░▀░▀▀▀░▀░▀░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 17.08.2026 8:20 A.M.
-- Description - Auto-completion of braces, parentheses, among other things.

return {
    "nvim-mini/mini.pairs", 
    version = false,

    config = function()
        require("mini.pairs").setup()
    end,
}
