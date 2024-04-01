-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Start Custom Config --
config.enable_wayland = true
config.front_end = "WebGpu"
local schemes = {'Bamboo', 'Catppuccin Frappe','Chalk','Darktooth (base16)',
  'Eighties (base16)', 'Everforest Dark (Gogh)','Materia (base16)',
  'Monokai Pro (Gogh)', 'Tango (base16)'}
config.color_scheme = 'Tango (base16)'
--[[ Example color schemes

config.color_scheme = 'Blue Scheme'

config.color_schemes = {
  ['Red Scheme'] = {
    background = 'red',
  },w
  ['Blue Scheme'] = {
    background = 'blue',
  },
}

--]]
config.audible_bell = 'SystemBeep'
config.use_fancy_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#0b0022',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#2b2042',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}


config.font = wezterm.font 'Hack'
config.font_size = 11
-- and finaly, return the configuration to wezterm
return config



--------------------------------------------------------------------------------
--[[

-- The set of schemes that we like and want to put in our rotation
local schemes = {}
for name, scheme in pairs(wezterm.get_builtin_color_schemes()) do
  table.insert(schemes, name)
end

wezterm.on('window-config-reloaded', function(window, pane)
  -- If there are no overrides, this is our first time seeing
  -- this window, so we can pick a random scheme.
  if not window:get_config_overrides() then
    -- Pick a random scheme name
    local scheme = schemes[math.random(#schemes)]
    window:set_config_overrides {
      color_scheme = scheme,
    }
    wezterm.log_info('Picked color scheme: ' .. scheme)
  end
end)

return {}


--[[ Fancy Tabs
config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

 Window Padding
config.window_padding = {
  left = 6,
  right = 6,
  top = 0,
  bottom = 0,
}


--]]
