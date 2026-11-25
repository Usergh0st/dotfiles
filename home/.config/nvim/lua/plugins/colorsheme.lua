-- ░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀░█░█░█▀▀░█▄█░█▀▀
-- ░█░░░█░█░█░░░█░█░█▀▄░▀▀█░█▀█░█▀▀░█░█░█▀▀
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀

-- ░█▀▀░█▀█░▀█▀░█▀█░█▀█░█░█░█▀▀░█▀▀░▀█▀░█▀█
-- ░█░░░█▀█░░█░░█▀▀░█▀▀░█░█░█░░░█░░░░█░░█░█
-- ░▀▀▀░▀░▀░░▀░░▀░░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:22 A.M.
-- Theme - https://github.com/catppuccin/nvim
-- Description - Plugin responsible for managing the colorscheme

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
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },

            styles = {
                comments = { "bold" },
                conditionals = { "bold" },
                loops = { "bold" },
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

            integrations = {
                alpha = true,
                fzf = true,
                treesitter = true,
                lualine = false,
                cmp = true,
                lsp_trouble = true,

                telescope = {
                    enabled = true,
                }
            },

            color_overrides = {
                mocha = {
                    -- Background
                    base   = "#141110", -- alacritty: primary.background
                    mantle = "#100e0d", -- derivado: base -10%
                    crust  = "#0c0b0a", -- derivado: base -20%

                    -- Text
                    text     = "#c4c3c3", -- alacritty: primary.foreground
                    subtext1 = "#99928e", -- mezcla 50% foreground + 50% normal.white
                    subtext0 = "#6e615a", -- alacritty: normal.white

                    -- Surfaces / overlays (UI)
                    surface0 = "#251c1a", -- alacritty: bright.white
                    surface1 = "#373634", -- alacritty: bright.cyan
                    surface2 = "#564c47", -- alacritty: bright.black
                    overlay0 = "#625650", -- mezcla 50% surface2 + 50% normal.white
                    overlay1 = "#6e615a", -- alacritty: normal.white
                    overlay2 = "#826758", -- mezcla 50% normal.white + 50% normal.black

                    -- Exact terminal accents
                    rosewater = "#c4c3c3", -- alacritty: foreground
                    flamingo  = "#b67b4e", -- alacritty: bright.red
                    pink      = "#be7682", -- alacritty: cursor.text / normal.yellow
                    mauve     = "#ae907f", -- mezcla 50% normal.magenta + 50% normal.black
                    maroon    = "#5b312c", -- alacritty: bright.magenta
                    yellow    = "#c79475", -- alacritty: normal.green
                    blue      = "#ceab9a", -- alacritty: normal.blue
                    lavender  = "#c7b3a8", -- alacritty: normal.magenta

                    -- Accents clarifier for readability
                    red      = "#b3886f", -- alacritty: normal.red
                    peach    = "#b67b4e", -- alacritty: bright.red
                    green    = "#a77c58", -- mezcla 50% normal.green + 50% bright.yellow
                    teal     = "#ac4830", -- alacritty: bright.blue
                    sky      = "#966d56", -- alacritty: normal.black
                    sapphire = "#ceab9a", -- alacritty: normal.blue
                },
             },
        })
        vim.cmd.colorscheme("catppuccin")
    end
}
