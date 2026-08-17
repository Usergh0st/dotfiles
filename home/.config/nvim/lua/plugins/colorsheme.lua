-- ░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀░█░█░█▀▀░█▄█░█▀▀
-- ░█░░░█░█░█░░░█░█░█▀▄░▀▀█░█▀█░█▀▀░█░█░█▀▀
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀

-- ░█▀▀░█▀█░▀█▀░█▀█░█▀█░█░█░█▀▀░█▀▀░▀█▀░█▀█
-- ░█░░░█▀█░░█░░█▀▀░█▀▀░█░█░█░░░█░░░░█░░█░█
-- ░▀▀▀░▀░▀░░▀░░▀░░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 17.08.2026 7:27 A.M.
-- Theme - https://github.com/catppuccin/nvim
-- Description - Plugin responsible for managing the colorscheme.

return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,

    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            background = {
                dark = "mocha",
            },

            transparent_background = true,
            float = {
                transparent = true,
                solid = true,
            },

            term_colors = true,
            no_italic = true,
            no_bold = false,
            no_underline = false,

            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },

            styles = {
                comments = { "bold" },
                conditionals = { "bold" },
                loops = {},
                functions = { "underline" },
                keywords = {},
                strings = {},
                variables = { "bold" },
                numbers = { "bold" },
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },

             color_overrides = {
                mocha = {
                    base = "#0d0b0c",
                    mantle = "#ffddf6",
                    crust = "#0d0b0c",
                    mauve = "#c9a0b2",
                    blue = "#f0bfd5",

                    -- rosewater = "#f5c9c1",
                    -- flamingo = "#f2b6b1",
                    -- pink = "#27834f",
                    -- red = "#e57474",
                    -- maroon = "#d67c7c",
                    -- peach = "#e5a17a",
                    -- yellow = "#e5c07a",
                    -- green = "#a3d68a",
                    -- teal = "#8ac4b8",
                    -- sky = "#8ac4d6",
                    -- sapphire = "#7ab6d6",
                    -- lavender = "#b8a3d6",

                    text = "#e0d5d8",
                    subtext1 = "#c4b5b9",
                    subtext0 = "#a8969b",
                    overlay2 = "#8c787d",
                    overlay1 = "#705f63",
                    overlay0 = "#8f727e",
                    surface2 = "#534249",
                    surface1 = "#2d2427",
                    surface0 = "#030202",
                },
             },
        })
        vim.cmd.colorscheme("catppuccin")
    end
}
