-- ░█▀█░█░░░█▀█░█░█░█▀█
-- ░█▀█░█░░░█▀▀░█▀█░█▀█
-- ░▀░▀░▀▀▀░▀░░░▀░▀░▀░▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:16 A.M.
-- Description - Plugin responsible for managing the colorscheme.

return {
    "goolord/alpha-nvim",
    priority = 1000,
    
    config = function ()
        local alpha = require"alpha"
        local dashboard = require"alpha.themes.dashboard"

        dashboard.section.header.val = {
 [[                               ______                        ]],
 [[                            .-"      "-.                     ]],
 [[                           /            \                    ]],
 [[                          |              |                   ]],
 [[                          |,  .-.  .-.  ,|                   ]],
 [[                          | )(_o/  \o_)( |                   ]],
 [[                          |/     /\     \|                   ]],
 [[           (@_            (_     ^^     _)         ghs3r     ]],
 [[      _     ) \____________\__|IIIIII|__/_______________   ]],
 [[     (_)@8@8{}<_____________|-\IIIIII/-|________________>  ]],
 [[            )_/             \          /                     ]],
 [[           (@                `--------`                      ]],
 [[]],
 [[     ▐▒▒▒▒▒▒  ▐▒▒▒▒▒▒ ▐▒▒▒▒▒  ▐▒   ▐▒▒ ▐▒▒▒▒▒▒ ▐▒▒▒▒▒▒▒▒  ]],
 [[     ▐▒▒ ▐▒▒▒ ▐▒      ▐▒  ▐▒▒ ▐▒▒  ▐▒▒   ▐▒    ▐▒▒ ▐▒ ▐▒▒ ]],
 [[     ▐▒▒  ▐▒▒ ▐▒▒▒    ▐▒▒ ▐▒▒ ▐▒▒  ▐▒▒   ▐▒▒   ▐▒▒ ▐▒ ▐▒▒ ]],
 [[     ▐▒▒  ▐▒▒ ▐▒▒     ▐▒▒ ▐▒▒ ▐▒▒  ▐▒▒   ▐▒▒   ▐▒▒    ▐▒▒ ]],
 [[     ▐▒▒  ▐▒▒ ▐▒▒▒▒▒▒ ▐▒▒▒▒▒   ▐▒▒▒▒▀  ▐▒▒▒▒▒▒ ▐▒▒    ▐▒▒ ]],
 [[                                                          ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("n", " " .. " New file", [[<cmd> ene <BAR> startinsert <cr>]]),
            dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
            dashboard.button("r", " " .. " Recent files", [[<cmd> Telescope oldfiles <cr>]]),
            dashboard.button("b", "󰘍 " .. " Recent Buffers", "<cmd> Telescope buffers <cr>"),
            dashboard.button("g", " " .. " Find text", [[<cmd> Telescope live_grep <cr>]]),
            dashboard.button("c", " " .. " Config", "<cmd> Telescope find_files cwd=~/.config/nvim hidden=true<CR>"),
            dashboard.button("h", "❤ " .. " Health", ":checkhealth<CR>"),
            dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
            dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
 
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
                    dashboard.section.footer.val = ("[ 󰧻 Neovim loaded %d/%d plugins in %.2fms ]"):format(
                        stats.loaded,
                        stats.count,
                        ms
            )
            pcall(vim.cmd.AlphaRedraw)
        end,
        })

        alpha.setup(dashboard.config)
    end,
}
