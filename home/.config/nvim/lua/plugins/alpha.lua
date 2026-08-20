-- ░█▀█░█░░░█▀█░█░█░█▀█
-- ░█▀█░█░░░█▀▀░█▀█░█▀█
-- ░▀░▀░▀▀▀░▀░░░▀░▀░▀░▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 19.08.2026 07:50 P.M.
-- Description - Plugin responsible for managing the colorscheme.

return {
    "goolord/alpha-nvim",
    priority = 1000,
    
    config = function ()
        local alpha = require"alpha"
        local dashboard = require"alpha.themes.dashboard"
        dashboard.section.header.val = {
  [[  █████               █████    █████              ]],
  [[ ░░███              ███░░░███ ░░███               ]],
  [[ ███████    █████  ███   ░░███ ░███████    ███████]],
  [[░░░███░    ███░░  ░███    ░███ ░███░░███  ███░░███]],
  [[  ░███    ░░█████ ░███    ░███ ░███ ░███ ░███ ░███]],
  [[  ░███ ███ ░░░░███░░███   ███  ░███ ░███ ░███ ░███]],
  [[  ░░█████  ██████  ░░░█████░   ████ █████░░███████]],
  [[   ░░░░░  ░░░░░░     ░░░░░░   ░░░░ ░░░░░  ░░░░░███]],
  [[                                          ███ ░███]],
  [[  ⛏                             ░░██████ ]],
  [[   ⛨                       ░░░░░░  ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button( "f", "󰍉 Files Explorer", ":Ex <CR>"),
            dashboard.button( "r", " Recent Files", ":browse oldfiles <CR>"),
            dashboard.button( "n", "󰈔 Create New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button( "c", " Configuration", ":Ex ~/.config/nvim/<CR>"),
            dashboard.button( "h", "❤ Check Health", ":checkhealth<CR>"),
            dashboard.button( "z", "󰒲 Lazy", ":Lazy <CR>"),
            dashboard.button( "q", " Quit", ":qa <CR>")
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
 
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        dashboard.section.footer.val = function()
            return vim.g.startup_time_ms or "[ ⌚]"
        end

        alpha.setup(dashboard.config)
    end,
}
