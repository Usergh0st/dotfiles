-- ░█▄█░▀█▀░█▀█░▀█▀
-- ░█░█░░█░░█░█░░█░
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀

-- ░█░█░▀█▀░█▀█░█▀█░▀█▀░▀█▀░█▀▀░█▀▄░█▀█░█▀▀
-- ░█▀█░░█░░█▀▀░█▀█░░█░░░█░░█▀▀░█▀▄░█░█░▀▀█
-- ░▀░▀░▀▀▀░▀░░░▀░▀░░▀░░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 17.08.2026 7:27 A.M.
-- Description - It provides color and syntax highlighting. 

return {
    "nvim-mini/mini.hipatterns",
    name = "mini_hipatterns",
    version = false,

    config = function()
        local hipatterns = require("mini.hipatterns")

        hipatterns.setup({
            highlighters = {
                fixme = {
                    pattern = "%f[%w]()FIXME()%f[%W]",
                    group = "MiniHipatternsFixme",
                },

                hack = {
                    pattern = "%f[%w]()HACK()%f[%W]",
                    group = "MiniHipatternsHack",
                },

                todo = {
                    pattern = "%f[%w]()TODO()%f[%W]",
                    group = "MiniHipatternsTodo",
                },

                note = {
                    pattern = "%f[%w]()NOTE()%f[%W]",
                    group = "MiniHipatternsNote",
                },

                hex_color = hipatterns.gen_highlighter.hex_color(),
            },

            delay = {
                text_change = 50,
                scroll = 50,
            },
        })
    end,
}
