return {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			flavour = 'mocha', -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = 'latte',
				dark = 'mocha',
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = 'dark',
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { 'italic' }, -- Change the style of comments
				conditionals = { 'italic' },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			integrations = {
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				illuminate = true,
				treesitter = true,
				treesitter_context = true,
				-- coc_nvim = true,
				hop = true,
				markdown = true,
			},

			color_overrides = {},
			custom_highlights = function(colors)
				return {
					IncSearch = { fg = '', bg = colors.surface1 },
					CurSearch = { fg = '', bg = colors.surface1 },
					CursorLineNr = { fg = colors.yellow },
					Search = { fg = '', bg = '' },
					TelescopeSelection = { fg = '', bg = colors.surface1 },
					PmenuSel = { fg = colors.rosewater },
					TabLineFill = { bg = '' },
					WinSeparator = { fg = colors.text },
					Cursor = { fg = '', bg = colors.overlay2 },
				}
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				treesitter = true,
				notify = false,
				mini = {
					enabled = false,
					indentscope_color = '',
				},
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { 'undercurl' },
						hints = { 'undercurl' },
						warnings = { 'undercurl' },
						information = { 'undercurl' },
					},
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme('catppuccin')
	end,
}
