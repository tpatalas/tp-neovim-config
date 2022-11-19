-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine rose-pine theme
local lualine_custom_theme = require("lualine.themes.powerline")

-- new colors for theme
local new_colors = {
	foam = "#9ccfd8",
	rose = "#ebbcba",
	iris = "#c4a7e7",
	gold = "#f6c177",
	base = "#191724",
	muted = "#6e6a86",
}

-- change nightlfy theme colors
lualine_custom_theme.normal.a.bg = new_colors.foam
lualine_custom_theme.insert.a.bg = new_colors.rose
lualine_custom_theme.visual.a.bg = new_colors.iris
lualine_custom_theme.command = {
	a = {
		gui = "bold",
		bg = new_colors.gold,
		fg = new_colors.base,
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		icons_enabled = true,
		theme = lualine_custom_theme,
		component_separators = "",
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
