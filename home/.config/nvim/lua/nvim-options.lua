-- ░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
-- ░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█
-- ░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 19.08.2026 07:50 P.M.
-- Description - Here's the options that can use nvim.

-- Line and nimbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Tabs and indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true

-- Cursor and highlighting
vim.opt.cursorline = true

-- Mouse and clipboard
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus';

-- Status line
vim.opt.showmode = true

-- Requiere font
vim.g.have_nerd_font = true

-- Text display
vim.opt.wrap = true
vim.opt.scrolloff = 5

-- Improves performance
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10
