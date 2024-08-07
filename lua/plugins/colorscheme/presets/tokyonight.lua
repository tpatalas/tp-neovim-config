-- https://github.com/folke/tokyonight.nvim

return {
	'folke/tokyonight.nvim',
	lazy = false,
	name = 'tokyonight',
	priority = 1000,
	config = function()
		require('tokyonight').setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = 'day', -- The theme is used when the background is set to light
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening an `:terminal` in [Neovim](https://github.com/neovim/neovim)
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = '', -- style for sidebars, see below
				floats = '', -- style for floating windows
			},
			sidebars = { 'qf', 'help' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

			--- You can override specific color groups to use other groups or a hex color
			--- function will be called with a ColorScheme table
			on_colors = function(colors) end,

			--- You can override specific highlights to use other groups or a hex color
			--- function will be called with a Highlights and ColorScheme table
			on_highlights = function(highlights, colors)
				highlights.IncSearch = { fg = colors.fg, bg = colors.blue7 }
				highlights.CurSearch = { fg = colors.fg, bg = colors.blue7 }
				highlights.LineNr = { fg = '', bg = '' }
				highlights.CursorLineNr = { fg = colors.yellow, bg = '' }
				highlights.Search = { fg = '', bg = '' }
				highlights.Cursor = { bg = colors.blue6 }
				highlights.WinSeparator = { fg = colors.orange }
				highlights.PmenuSel = { fg = colors.bg_bg_visual }
				highlights.Pmenu = { fg = colors.blue, bg = '' }
				highlights.MatchParen = { fg = colors.yellow, bg = colors.blue0 }
				highlights.CustomMarkdownCodeBlock = { bg = colors.bg_highlight }
				highlights.CustomMarkdownHorizontalRule = { fg = colors.comment }
				highlights.CustomMarkdownHeadingUnderline1 = { fg = colors.dark5 }
				highlights.CustomMarkdownHeadingUnderline2 = { fg = colors.comment }
				highlights.CustomMarkdownHeadingUnderline3 = { fg = colors.comment }

				-- highlights['@markup.heading.1.markdown'] = { fg = colors.red }
				-- highlights['@markup.heading.2.marker.markdown'] = { fg = colors.orange }
				-- highlights['@markup.heading.2.markdown'] = { fg = colors.orange }
				-- highlights['@markup.heading.3.marker.markdown'] = { fg = colors.yellow }
				-- highlights['@markup.heading.3.markdown'] = { fg = colors.yellow }
				-- highlights['@markup.heading.4.marker.markdown'] = { fg = colors.green }
				-- highlights['@markup.heading.4.markdown'] = { fg = colors.green }
				-- highlights['@markup.heading.5.marker.markdown'] = { fg = colors.cyan }
				-- highlights['@markup.heading.5.markdown'] = { fg = colors.main.cyan }
				-- highlights['@markup.heading.6.marker.markdown'] = { fg = colors.blue }
				-- highlights['@markup.heading.6.markdown'] = { fg = colors.blue }

				-- highlights.TelescopeBorder = { fg = colors.float, bg = '' }
				-- highlights.TelescopePromptTitle = { bg = '' }
				-- highlights.TelescopePromptBorder = { bg = '' }
				-- highlights.TelescopeNormal = { bg = '' }
				-- highlights.TelescopeSelection = { fg = '', bg = colors.bg_visual }
				-- highlights.TelescopeResultsIdentifier = { fg = '' }
				-- highlights.FloatBorder = { fg = colors.purple, bg = '' }
				-- highlights.NormalFloat = { fg = colors.float, bg = '' }
				-- highlights.TabLineFill = { bg = '' }
				--     ['@markup.heading.1.marker.markdown'] = { fg = colors.main.red, bold = true }
				-- highlights['@markup.raw.markdown_inline'] = { fg = '', bg = colors.orange }
				-- highlights['@punctuation.special.markdown'] = { fg = colors.orange }
			end,
		})
		vim.cmd('colorscheme tokyonight')
	end,
}
