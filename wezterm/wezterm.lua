local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.term = 'wezterm'
config.font_size = 22.0
config.line_height = 1.2
config.font = wezterm.font('Berkeley Mono')
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.adjust_window_size_when_changing_font_size = false

-- performance
config.max_fps = 120
config.animation_fps = 120
config.prefer_egl = true

-- background blur
config.window_background_opacity = 1.0
-- config.macos_window_background_blur = 40

-- config.enable_kitty_graphics = false
config.window_close_confirmation = 'NeverPrompt'
config.audible_bell = 'Disabled'
config.cursor_blink_rate = 0
config.allow_square_glyphs_to_overflow_width = 'Always'

config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'

config.hide_mouse_cursor_when_typing = true

config.initial_rows = 100
config.initial_cols = 205

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.color_scheme = 'Rose Pine'

return config
