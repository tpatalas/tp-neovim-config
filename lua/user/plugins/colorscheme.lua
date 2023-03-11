-- https://github.com/folke/tokyonight.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

return {
	'folke/tokyonight.nvim',
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	branch = 'main',
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local custom = {
			highlight = '#51566F',
		}
		require('tokyonight').setup({
			style = 'moon',
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
			sidebars = { 'qf', 'help', 'mason' },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = true,
			on_colors = function(colors) end,
			on_highlights = function(highlights, colors)
				highlights.MatchParen = { fg = '', bg = custom.highlight }
				highlights.IncSearch = { fg = '', bg = custom.highlight }
				highlights.Search = { fg = colors.yellow, bg = '' }
				highlights.LineNr = { fg = colors.comment, bg = '' }
				highlights.CursorLineNr = { fg = colors.yellow, bg = colors.bg_highlight }
				highlights.CursorLine = { bg = colors.bg_highlight }
				highlights.ColorColumn = { bg = colors.bg_highlight }
				highlights.Cursor = { bg = colors.yellow }
				highlights.NormalFloat = { bg = colors.bg }
				highlights.MsgArea = { fg = colors.fg_dark, bg = '' }
				highlights.SpellBad = { fg = '', bg = '', undercurl = true, sp = colors.orange }
				highlights.SpellCap = { fg = '', bg = '', undercurl = true, sp = colors.orange }
				highlights.SpellRare = { fg = '', bg = '', undercurl = true, sp = colors.orange }
				highlights.SpellLocal = { fg = '', bg = '', undercurl = true, sp = colors.orange }
			end,
		})

		vim.cmd([[colorscheme tokyonight]])
	end,
}
