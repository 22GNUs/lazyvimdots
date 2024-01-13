local g = vim.g
local o = vim.opt
local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end
if g.neovide ~= nil then
  o.guifont = { "FantasqueSansM Nerd Font", ":h18" }
  -- g.neovide_fullscreen = true
  g.neovide_scroll_animation_length = 0.6
  g.neovide_no_idle = true
  g.neovide_refresh_rate = 120
  g.neovide_hide_mouse_when_typing = true
  g.neovide_remember_dimensions = true
  g.neovide_remember_window_size = true
  g.neovide_padding_top = 48

  -- transparency
  if g.transparency then
    g.transparency = true
    g.neovide_transparency = 0.0
    g.neovide_transparency_point = 0.8
    g.transparency = 0.95
    g.neovide_background_color = "#1E1E2E" .. alpha()
    g.winblend = 0
  end

  -- blur
  g.neovide_floating_blur_amount_x = 10.0
  g.neovide_floating_blur_amount_y = 10.0

  -- vfx mode
  -- g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_cursor_vfx_mode = "railgun"
  g.neovide_cursor_vfx_particle_phase = 1.5
  g.neovide_cursor_vfx_particle_curl = 1.0

  -- fix neovide system clipboard
  -- in macos, c means <ctrl>, D means <cmd>
  vim.cmd('nmap <D-c> "+y')
  vim.cmd('vmap <D-c> "+y')
  vim.cmd('nmap <D-v> "+p')
  -- in normal mode <c-r> will open reigster
  vim.cmd("inoremap <D-v> <c-r>+")
  vim.cmd("cnoremap <D-v> <c-r>+")
end
