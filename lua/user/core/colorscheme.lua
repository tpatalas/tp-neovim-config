local groups = {
	-- https://github.com/EdenEast/nightfox.nvim/blob/main/usage.md#palette
	all = {
		Whitespace = { link = 'Comment' },
		IncSearch = { fg = '', bg = 'palette.bg4' },
		Search = { fg = 'palette.yellow.dim', bg = '' },
		ColorColumn = { bg = 'palette.bg3' },
		CursorLineNr = { fg = 'palette.yellow.dim', bg = 'palette.bg3' },
		CursorLine = { bg = 'palette.bg3' },
		MatchParen = { gui = 'NONE', fg = 'palette.yellow.base' },
		Visual = { bg = 'palette.bg4' },
		TelescopeBorder = { fg = 'palette.fg2', bg = '' },
		NvimTreeNormal = { fg = '', bg = 'palette.bg0' },
	},
}

-- Default options
require('nightfox').setup({
	options = {
		compile_path = vim.fn.stdpath('cache') .. '/nightfox',
		compile_file_suffix = '_compiled',
		transparent = true,
		terminal_colors = true,
		dim_inactive = false,
		module_default = true,
		styles = {
			comments = 'italic',
			conditionals = 'NONE',
			constants = 'NONE',
			functions = 'italic',
			keywords = 'NONE',
			numbers = 'NONE',
			operators = 'NONE',
			strings = 'NONE',
			types = 'NONE',
			variables = 'NONE',
		},
		inverse = {
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = {},
	},
	palettes = {},
	specs = {},
	groups = groups,
})

vim.cmd('colorscheme terafox')
