-- ░█▀▀░█▀▀░█▀▄░▀█▀░█▀█░▀█▀░█▀▀
-- ░▀▀█░█░░░█▀▄░░█░░█▀▀░░█░░▀▀█
-- ░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░░░░▀░░▀▀▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 12.08.2026 1:39 PM
-- Description - custom scripts for nvim.

-- Detect if the cursor moves to center the editor
local auto_command_zz = function()
    vim.cmd("normal! zz")
end

vim.api.nvim_create_autocmd("CursorMoved", {
    callback = auto_command_zz,
})
