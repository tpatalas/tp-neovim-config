-- https://github.com/rose-pine/neovim
-- https://rosepinetheme.com/palette/

return {
	'rose-pine/neovim',
	lazy = false,
	priority = 1000,
	config = function()
		require('rose-pine').setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = 'main',
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = 'main',
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = true,
			disable_float_background = true,
			disable_italics = false,

			--- @usage string hex value or named color from rosepinetheme.com/palette
			groups = {
				background = 'base',
				background_nc = '_experimental_nc',
				panel = 'surface',
				panel_nc = 'base',
				border = 'highlight_med',
				comment = 'muted',
				link = 'iris',
				punctuation = 'subtle',

				error = 'love',
				hint = 'iris',
				info = 'foam',
				warn = 'gold',

				headings = {
					h1 = 'iris',
					h2 = 'foam',
					h3 = 'rose',
					h4 = 'gold',
					h5 = 'pine',
					h6 = 'foam',
				},
				-- or set all headings at once
				-- headings = 'subtle'
			},

			-- Change specific vim highlight groups
			-- https://github.com/rose-pine/neovim/wiki/Recipes
			highlight_groups = {
				CursorLine = { bg = 'foam', blend = 10 },
				Cursor = { bg = 'gold', blend = 50 },
				IncSearch = { fg = '', bg = 'gold', blend = 20 },
				search = { fg = '', bg = 'gold', blend = 20 },
				StatusLine = { fg = 'love', bg = 'love', blend = 10 },
				LineNr = { fg = 'muted', bg = '' },
				CursorLineNr = { fg = 'gold', bg = '' },
				TelescopeBorder = { fg = 'subtle', bg = '' },
				TelescopeResultsIdentifier = { fg = '' },
				TelescopePromptCounter = { fg = 'subtle' },
				FloatBorder = { fg = 'iris', bg = '' },
				NormalFloat = { fg = 'muted', bg = '' },
				GitSignsDelete = { fg = 'love', bg = '' },
				GitSignsChange = { fg = 'gold', bg = '' },
				GitSignsAdd = { fg = 'pine', bg = '' },
				GitSigns = { fg = 'pine', bg = '' },
				NonText = { fg = 'overlay' },
				CmpItemAbbrMatch = { fg = 'rose', bg = '' },
				CmpItemAbbrMatchFuzzy = { fg = 'rose', bg = '' },
				ToggleTerm1FloatBorder = { fg = 'muted' },
				Normal = { fg = 'subtle' },
			},
		})

		-- Set colorscheme after options
		vim.cmd('colorscheme rose-pine')
	end,
}
