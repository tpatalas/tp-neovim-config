-- https://github.com/folke/tokyonight.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

local custom_highlight = '#404459'

require('tokyonight').setup({
	style = 'night',
	light_style = 'day',
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = 'dark',
		floats = 'dark',
	},
	sidebars = { 'qf', 'help' },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = true,
	on_colors = function(colors) end,
	on_highlights = function(highlights, colors)
		highlights.IncSearch = { fg = '', bg = colors.bg_highlight }
		highlights.Search = { fg = colors.yellow, bg = '' }
		highlights.CursorLineNr = { fg = colors.yellow, bg = custom_highlight }
		highlights.CursorLine = { bg = custom_highlight }
		highlights.ColorColumn = { bg = custom_highlight }
		highlights.Cursor = { bg = colors.yellow }
		highlights.MatchParen = { fg = colors.orange, bg = colors.bg }
	end,
})

vim.cmd([[colorscheme tokyonight]])

