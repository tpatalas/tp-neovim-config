-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine rose-pine theme
local lualine_rosepine = require("lualine.themes.palenight")

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
lualine_rosepine.normal.a.bg = new_colors.foam
lualine_rosepine.insert.a.bg = new_colors.rose
lualine_rosepine.visual.a.bg = new_colors.iris
lualine_rosepine.command = {
	a = {
		gui = "bold",
		bg = new_colors.gold,
		fg = new_colors.base,
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_rosepine,
	},
})
