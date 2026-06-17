local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Color schemes
local gruvbox_dark = {
  foreground = "#ebdbb2",
  background = "#282828",
  cursor_bg = "#d79921",
  cursor_fg = "#282828",
  cursor_border = "#ebdbb2",
  selection_fg = "#282828",
  selection_bg = "#ebdbb2",
  scrollbar_thumb = "#504945",
  split = "#504945",
  ansi = {
    "#282828",
    "#cc241d",
    "#98971a",
    "#d79921",
    "#458588",
    "#b16286",
    "#689d6a",
    "#a89984",
  },
  brights = {
    "#928374",
    "#fb4934",
    "#b8bb26",
    "#fabd2f",
    "#83a598",
    "#d3869b",
    "#8ec07c",
    "#ebdbb2",
  },
  tab_bar = {
    background = "#282828",
    inactive_tab_edge = "#504945",
    active_tab = {
      bg_color = "#504945",
      fg_color = "#ebdbb2",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#3c3836",
      fg_color = "#a89984",
    },
    inactive_tab_hover = {
      bg_color = "#504945",
      fg_color = "#ebdbb2",
      italic = true,
    },
    new_tab = {
      bg_color = "#282828",
      fg_color = "#a89984",
    },
    new_tab_hover = {
      bg_color = "#3c3836",
      fg_color = "#ebdbb2",
    },
  },
}

local gruvbox_light = {
  foreground = "#3c3836",
  background = "#fbf1c7",
  cursor_bg = "#d79921",
  cursor_fg = "#fbf1c7",
  cursor_border = "#3c3836",
  selection_fg = "#fbf1c7",
  selection_bg = "#3c3836",
  scrollbar_thumb = "#d5c4a1",
  split = "#d5c4a1",
  ansi = {
    "#fbf1c7",
    "#cc241d",
    "#98971a",
    "#d79921",
    "#458588",
    "#b16286",
    "#689d6a",
    "#7c6f64",
  },
  brights = {
    "#928374",
    "#9d0006",
    "#79740e",
    "#b57614",
    "#076678",
    "#8f3f71",
    "#427b58",
    "#3c3836",
  },
  tab_bar = {
    background = "#fbf1c7",
    inactive_tab_edge = "#d5c4a1",
    active_tab = {
      bg_color = "#d5c4a1",
      fg_color = "#3c3836",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#ebdbb2",
      fg_color = "#7c6f64",
    },
    inactive_tab_hover = {
      bg_color = "#d5c4a1",
      fg_color = "#3c3836",
      italic = true,
    },
    new_tab = {
      bg_color = "#fbf1c7",
      fg_color = "#7c6f64",
    },
    new_tab_hover = {
      bg_color = "#ebdbb2",
      fg_color = "#3c3836",
    },
  },
}

-- -- XXX: Breaks wezterm (investigate)
-- -- Automatically switch based on system appearance
-- local function scheme_for_appearance(appearance)
--   if appearance:find("Dark") then
--     return gruvbox_dark
--   else
--     return gruvbox_light
--   end
-- end

config.colors = gruvbox_dark

-- -- XXX: Breaks wezterm (investigate)
-- Force tab bar to update with appearance
-- wezterm.on("window-config-reloaded", function(window, pane)
--   local overrides = window:get_config_overrides() or {}
--   local appearance = window:get_appearance()
--   overrides.colors = scheme_for_appearance(appearance)
--   window:set_config_overrides(overrides)
-- end)

-- Keybindings
config.keys = {
  -- Switching tab panes
  { key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
  -- Resize panes
  { key = "h", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
  { key = "j", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
  { key = "k", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
  { key = "l", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
  -- Closing tab pane
  { key = "x", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
  -- Pass Ctrl+Arrow to Neovim
  { key = "LeftArrow", mods = "CTRL", action = wezterm.action.SendKey({ key = "LeftArrow", mods = "CTRL" }) },
  { key = "RightArrow", mods = "CTRL", action = wezterm.action.SendKey({ key = "RightArrow", mods = "CTRL" }) },
  { key = "UpArrow", mods = "CTRL", action = wezterm.action.SendKey({ key = "UpArrow", mods = "CTRL" }) },
  { key = "DownArrow", mods = "CTRL", action = wezterm.action.SendKey({ key = "DownArrow", mods = "CTRL" }) },
  -- Reorder tabs
  {
    key = "h",
    mods = "CMD|SHIFT",
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = "l",
    mods = "CMD|SHIFT",
    action = wezterm.action.MoveTabRelative(1),
  },
}

config.font_size = 15
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 0
config.tab_bar_at_bottom = true
config.window_padding = { left = 2, right = 2, top = 2, bottom = 2 }
config.use_fancy_tab_bar = false
-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 20

-- -- Detect if running on Windows
-- local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
-- -- Default to WSL
-- if is_windows then
--   -- config.default_prog = { "wsl.exe", "--cd", "~" }
--   config.default_domain = "WSL:Ubuntu"
-- end
-- -- Only enable Unix domains on actual Unix systems (macOS/Linux)
-- if not is_windows then
--   config.unix_domains = { { name = "unix" } }
--   config.default_gui_startup_args = { "connect", "unix" }
-- end

-- Enable session persistence
config.unix_domains = { { name = "unix" } }
config.default_gui_startup_args = { "connect", "unix" }

return config
