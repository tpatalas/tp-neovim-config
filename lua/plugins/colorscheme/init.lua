-- https://github.com/catppuccin/nvim
-- https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md

return {
	'catppuccin/nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			flavour = 'mocha', -- latte, frappe, macchiato, mocha
			transparent_background = true, -- disables setting the background color.
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				telescope = true,
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { 'italic' },
						hints = { 'italic' },
						warnings = { 'italic' },
						information = { 'italic' },
					},
					underlines = {
						errors = { 'undercurl' },
						hints = { 'undercurl' },
						warnings = { 'undercurl' },
						information = { 'undercurl' },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
			custom_highlights = function(colors)
				return {
					MatchParen = { fg = '', bg = colors.surface2 },
					IncSearch = { fg = '', bg = colors.surface2 },
					CurSearch = { fg = '', bg = colors.surface2 },
					CursorLine = { fg = '', bg = colors.surface1 },
					Search = { fg = '', bg = '' },
					Cursor = { fg = '', bg = colors.rosewater },
					TelescopeBorder = { fg = colors.overlay0, bg = '' },
					TelescopeSelection = { fg = '', bg = colors.surface0 },
					TelescopeResultsIdentifier = { fg = '' },
					FloatBorder = { fg = colors.mauve, bg = '' },
					NormalFloat = { fg = colors.overlay0, bg = '' },
					Pmenu = { fg = colors.teal, bg = '' },
					PmenuThumb = { fg = colors.overlay0 },
					PmenuSel = { fg = colors.text },
					TabLineFill = { bg = '' },
					CmpItemAbbrMatch = { fg = colors.pink, bg = '' },
					CmpItemAbbrMatchFuzzy = { fg = colors.pink, bg = '' },
					Substitute = { fg = colors.red, bg = '' },
					HarpoonInactive = { fg = colors.surface2 },
					HarpoonNumberInactive = { fg = colors.surface2 },
					HarpoonActive = { fg = colors.surface, bg = colors.surface1 },
					HarpoonNumberActive = { fg = colors.surface, bg = colors.surface1 },
					IndentBlanklineContextChar = { fg = colors.rosewater, bg = '' },
					IndentBlankLineIndent = { fg = colors.surface0, bg = '' },
					GitSignsDelete = { fg = colors.pink, bg = '' },
					GitSignsChange = { fg = colors.yellow, bg = '' },
					GitSignsAdd = { fg = colors.teal, bg = '' },
					GitSigns = { fg = colors.teal, bg = '' },
					NonText = { fg = colors.text },
					FlashLabel = { fg = colors.crust, bg = colors.yellow },
				}
			end,
		})
		vim.cmd('colorscheme catppuccin')
	end,
}
