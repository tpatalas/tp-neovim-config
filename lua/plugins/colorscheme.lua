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
					Search = { fg = 'palette.red', bg = '' },
					TelescopeBorder = { fg = 'palette.white' },
					VertSplit = { fg = 'palette.white' },
					NormalFloat = { bg = '' },
				},
			},
		})
		vim.cmd('colorscheme nightfox')
	end,
}
