--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "monospace normal 9"
theme.fg   = "#1f1f1f"
theme.bg   = "#d9d9d9"

-- Genaral colours
theme.success_fg = "#0f0"
theme.loaded_fg  = "#33AADD"
theme.error_fg = "#1f1f1f"
theme.error_bg = "#dc322f"

-- Warning colours
theme.warning_fg = "#dc322f"
theme.warning_bg = "#1f1f1f"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#1f1f1f"

-- Menu colours
theme.menu_fg                   = "#d9d9d9"
theme.menu_bg                   = "#1f1f1f"
theme.menu_selected_fg          = "#d9d9d9"
theme.menu_selected_bg          = "#FF0"
theme.menu_title_bg             = "#1f1f1f"
theme.menu_primary_title_fg     = "#f00"
theme.menu_secondary_title_fg   = "#666"

-- Proxy manager
theme.proxy_active_menu_fg      = '#d9d9d9'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = "#d9d9d9"
theme.sbar_bg         = "#1f1f1f"

-- Downloadbar specific
theme.dbar_fg         = "#1f1f1f"
theme.dbar_bg         = "#d9d9d9"
theme.dbar_error_fg   = "#dc322f"

-- Input bar specific
theme.ibar_fg           = "#d9d9d9"
theme.ibar_bg           = "#1f1f1f"

-- Tab label
theme.tab_fg            = "#888"
theme.tab_bg            = "#222"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#d9d9d9"
theme.selected_bg       = "#002b36"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = "#d9d9d9"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#F00"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
