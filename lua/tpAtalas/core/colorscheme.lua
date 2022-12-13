local groups = {
	-- https://github.com/EdenEast/nightfox.nvim/blob/main/usage.md#palette
	all = {
		Whitespace = { link = 'Comment' },
		IncSearch = { fg = '', bg = 'palette.bg3' },
		ColorColumn = { bg = 'palette.bg2' },
		CursorLineNr = { fg = 'palette.yellow.dim', bg = 'palette.bg2' },
		CursorLine = { bg = 'palette.bg2' },
		MatchParen = { gui = 'NONE', fg = 'palette.yellow.base' },
	},
}

-- Default options
require('nightfox').setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath('cache') .. '/nightfox',
		compile_file_suffix = '_compiled', -- Compiled file suffix
		transparent = false, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
			conditionals = 'NONE',
			constants = 'NONE',
			functions = 'italic,bold',
			keywords = 'NONE',
			numbers = 'NONE',
			operators = 'NONE',
			strings = 'NONE',
			types = 'NONE',
			variables = 'NONE',
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
		},
	},
	palettes = {},
	specs = {},
	groups = groups,
})

-- setup must be called before loading
vim.cmd('colorscheme nightfox')
