-- ░█▀▀░█▄█░█▀▀░█▀█░█▀▄░█▀▀░█░█░█▀▄░█▀▀░█▀█░█▀▄
-- ░▀▀█░█░█░█▀▀░█▀█░█▀▄░█░░░█░█░█▀▄░▀▀█░█░█░█▀▄
-- ░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀

-- Usergh0st - https://github.com/Usergh0st/dotfiles
-- Version - NVIM 0.12.4
-- Date - 19.08.2026 07:50 P.M.
-- Description - Cool effects and animations with the cursor.

return {
    "sphamba/smear-cursor.nvim",
    name = "smearcursor",
    priority = 1000, 

    opts = {
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
        legacy_computing_symbols_support = true,
        smear_insert_mode = true,

        transparent_bg_fallback_color = "#0d0b0c",
        stiffness = 0.9,                            -- 0.6      [0, 1]
        trailing_stiffness = 0.6,                   -- 0.45     [0, 1]
        stiffness_insert_mode = 0.7,                -- 0.5      [0, 1]
        trailing_stiffness_insert_mode = 0.7,       -- 0.5      [0, 1]
        damping = 0.95,                             -- 0.85     [0, 1]
        damping_insert_mode = 0.95,                 -- 0.9      [0, 1]
        distance_stop_animating = 0.5,              -- 0.1      > 0
        time_interval = 7,                          -- milliseconds
    },
}
