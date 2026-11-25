-- ░▀█▀░█▀▄░█▀▀░█▀▀░█▀▀░▀█▀░▀█▀░▀█▀░█▀▀░█▀▄
-- ░░█░░█▀▄░█▀▀░█▀▀░▀▀█░░█░░░█░░░█░░█▀▀░█▀▄
-- ░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░░░▀░░▀▀▀░▀░▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.6
-- Date - 25.11.2026 11:18 A.M.
-- Description - syntax highlighting and improved view.

return {
    'nvim-treesitter/nvim-treesitter',
    branch = "main",
    lazy = false,
    priority = 1000,
    build = ':TSUpdate',

    config = function()

        local ts = require("nvim-treesitter")

        ts.setup({
            install_dir = vim.fn.stdpath('data') .. '/site'
        })

        local parsers = {
        "bash",
        "lua",
        "zsh",
        "markdown"
        }

        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = parsers,
            callback = function(event)
                vim.treesitter.start(event.buf)
                vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo.foldmethod = 'expr'
                vim.opt.foldenable = true
                vim.opt.foldlevel = 99
            end,
        })
    end,
}
