-- ░█░░░█▀█░▀▀█░█░█
-- ░█░░░█▀█░▄▀░░░█░
-- ░▀▀▀░▀░▀░▀▀▀░░▀░

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Lazy - 11.17.5
-- Date - 17.08.2026 7:27 A.M.
-- Description - Plugin manager for lazy people like me.

-- Bootstrap lazy-nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" }
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    checker = {
            enabled = true,
            notify = true,
            frequency = 3600,
    },
})
