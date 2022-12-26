-- https://github.com/folke/tokyonight.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

local custom = {
	highlight = '#51566F',
}

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
		floats = 'transparent',
	},
	sidebars = { 'qf', 'help' },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = true,
	on_colors = function(colors) end,
	on_highlights = function(highlights, colors)
		highlights.IncSearch = { fg = '', bg = custom.highlight }
		highlights.Search = { fg = colors.yellow, bg = '' }
		highlights.LineNr = { fg = colors.comment, bg = '' }
		highlights.CursorLineNr = { fg = colors.yellow, bg = colors.bg_highlight }
		highlights.CursorLine = { bg = colors.bg_highlight }
		highlights.ColorColumn = { bg = colors.bg_highlight }
		highlights.Cursor = { bg = colors.yellow }
		highlights.MatchParen = { fg = '', bg = custom.highlight }
	end,
})

vim.cmd([[colorscheme tokyonight]])
