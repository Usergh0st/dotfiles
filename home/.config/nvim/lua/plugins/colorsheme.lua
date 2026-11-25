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
                    base   = "#070807", -- alacritty: primary.background
                    mantle = "#0a0a0a", -- derivado: base -10%
                    crust  = "#050505", -- derivado: base -20%

                    -- Text
                    text     = "#c1c1c5", -- alacritty: primary.foreground
                    subtext1 = "#a8a8b2", -- mezcla 50% foreground + 50% normal.white
                    subtext0 = "#7a7a84", -- alacritty: normal.white

                    -- Surfaces / overlays (UI)
                    surface0 = "#1a1a22", -- alacritty: bright.white
                    surface1 = "#2a2a32", -- alacritty: bright.cyan
                    surface2 = "#3a3a42", -- alacritty: bright.black
                    overlay0 = "#4a4a52", -- mezcla 50% surface2 + 50% normal.white
                    overlay1 = "#5a5a62", -- alacritty: normal.white
                    overlay2 = "#6a6a72", -- mezcla 50% normal.white + 50% normal.black

                    -- Exact terminal accents
                    rosewater = "#c1c1c5", -- alacritty: foreground
                    flamingo  = "#b3886f", -- alacritty: normal.red (ajustado para mejor contraste)
                    pink      = "#EADAB3", -- alacritty: cursor.text / normal.yellow
                    mauve     = "#b8a898", -- mezcla 50% normal.magenta + 50% normal.black (ajustado para legibilidad)
                    maroon    = "#8a7a7a", -- alacritty: bright.magenta
                    yellow    = "#c4b09a", -- alacritty: normal.green
                    blue      = "#B79D8F", -- alacritty: normal.blue
                    lavender  = "#c3c3c5", -- alacritty: normal.magenta

                    -- Accents clarifier for readability
                    red      = "#b3886f", -- alacritty: normal.red
                    peach    = "#b3886f", -- alacritty: normal.red (ajustado para mejor contraste)
                    green    = "#a8a8b2", -- alacritty: normal.yellow (ajustado para mejor legibilidad)
                    teal     = "#a08060", -- alacritty: bright.blue (ajustado para mejor contraste)
                    sky      = "#968587", -- alacritty: normal-black
                    sapphire = "#d4c4b4", -- alacritty: normal.blue
                },
             },
        })
        vim.cmd.colorscheme("catppuccin")
    end
}
