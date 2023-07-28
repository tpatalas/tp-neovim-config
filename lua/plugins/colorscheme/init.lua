-- https://rosepinetheme.com/palette/

return {
	'rose-pine/neovim',
	name = 'rose-pine',
	lazy = false,
	priority = 1000,
	config = function()
		require('rose-pine').setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = 'auto',
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = 'main',
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = true,
			disable_float_background = true,
			disable_italics = false,
			highlight_groups = {
				MatchParen = { fg = '', bg = 'highlight_med' },
				IncSearch = { fg = '', bg = 'highlight_med' },
				CursorLine = { fg = '', bg = 'overlay' },
				Cursor = { fg = '', bg = 'subtle' },
				Search = { fg = '', bg = '' },
				TelescopeBorder = { fg = 'highlight_high', bg = '' },
				FloatBorder = { fg = 'base', bg = 'base' },
				NormalFloat = { fg = 'subtle', bg = 'base' },
				Pmenu = { fg = 'foam', bg = 'base' },
				PmenuThumb = { fg = 'subtle' },
				PmenuSel = { fg = 'text' },
				TabLineFill = { bg = '' },
				CmpItemAbbrMatch = { fg = 'rose', bg = '' },
				CmpItemAbbrMatchFuzzy = { fg = 'rose', bg = '' },
				Substitute = { fg = 'love', bg = '' },
				HarpoonInactive = { fg = 'highlight_med' },
				HarpoonNumberInactive = { fg = 'highlight_med' },
				HarpoonActive = { fg = 'subtle', bg = 'highlight_med' },
				HarpoonNumberActive = { fg = 'subtle', bg = 'highlight_med' },
				IndentBlanklineContextChar = { fg = 'rose', bg = '' },
				IndentBlankLineIndent = { fg = 'overlay', bg = '' },
				GitSignsDelete = { fg = 'love', bg = '' },
				GitSignsChange = { fg = 'gold', bg = '' },
				GitSignsAdd = { fg = 'foam', bg = '' },
				GitSigns = { fg = 'foam', bg = '' },
			},
		})
		vim.cmd('colorscheme rose-pine')
	end,
}
