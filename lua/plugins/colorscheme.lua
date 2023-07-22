-- https://github.com/EdenEast/nightfox.nvim/blob/main/usage.md#palette

return {
	'EdenEast/nightfox.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('nightfox').setup({
			options = {
				transparent = true,
				styles = {
					-- comments = 'italic',
					keywords = 'italic',
					types = 'italic,bold',
				},
			},
			groups = {
				all = {
					MatchParen = { fg = '', bg = 'sel1' },
					IncSearch = { fg = '', bg = 'sel1' },
					Search = { fg = '', bg = '' },
					TelescopeBorder = { fg = 'palette.white' },
					VertSplit = { fg = 'palette.bg3' },
					NormalFloat = { fg = '', bg = 'palette.bg1' },
					FloatBorder = { fg = 'palette.bg1', bg = 'palette.bg1' },
					Pmenu = { fg = 'palette.bg0', bg = 'palette.bg0' },
					TabLineFill = { bg = '' },
					HarpoonInactive = { fg = 'sel1' },
					HarpoonActive = { fg = 'palette.fg0', bg = 'palette.bg2' },
					HarpoonNumberActive = { fg = 'palette.fg0', bg = 'palette.bg2' },
					HarpoonNumberInactive = { fg = 'sel1' },
				},
			},
		})
		vim.cmd('colorscheme nightfox')
	end,
}
