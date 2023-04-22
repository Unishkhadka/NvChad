require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- FOR NEOVIDE
local g=vim.g
if vim.g.neovide then -- only run the following command if neovide exists
  -- opt.guifont = "Iosevka:h11", "JetBrains Nerd Font:h11"

  g.neovide_cursor_antialiasing = true

  g.neovide_cursor_animate_command_line = false

  g.neovide_transparency = 0.5

  g.neovide_confirm_quit = true

  g.neovide_fullscreen = false

  g.neovide_remember_window_size = true

  g.neovide_refresh_rate = 60

  g.neovide_cursor_animation_length = 0.1

  g.neovide_cursor_trail_size = 0.1

  g.neovide_cursor_vfx_opacity = 200.0

  g.neovide_cursor_vfx_mode = "torpedo"
end
