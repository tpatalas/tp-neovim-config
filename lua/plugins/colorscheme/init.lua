-- https://github.com/marko-cerovac/material.nvim
-- https://github.com/marko-cerovac/material.nvim/blob/main/lua/material/colors/init.lua

vim.g.material_style = 'deep ocean' -- darker | lighter | oceanic | palenight | deep ocean

return {
	'marko-cerovac/material.nvim',
	lazy = false,
	priority = 1000,
	name = 'material',
	config = function()
		local material = require('material')
		local colors = require('material.colors')
		local custom_color = {
			selection = '#292e42',
			search = '#394b70',
		}

		require('material').setup({
			contrast = {
				terminal = false, -- Enable contrast for the built-in terminal
				sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
				floating_windows = false, -- Enable contrast for floating windows
				cursor_line = false, -- Enable darker background for the cursor line
				non_current_windows = false, -- Enable contrasted background for non-current windows
				filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
			},

			plugins = { -- Uncomment the plugins that you use to highlight them
				-- Available plugins:
				'gitsigns',
				'harpoon',
				'indent-blankline',
				'lspsaga',
				'nvim-cmp',
				'nvim-web-devicons',
			},

			disable = {
				colored_cursor = false, -- Disable the colored cursor
				borders = false, -- Disable borders between vertically split windows
				background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
				term_colors = false, -- Prevent the theme from setting terminal colors
				eob_lines = false, -- Hide the end-of-buffer lines
			},

			high_visibility = {
				lighter = false, -- Enable higher contrast text for lighter style
				darker = false, -- Enable higher contrast text for darker style
			},

			lualine_style = 'default', -- Lualine style ( can be 'stealth' or 'default' )

			async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

			custom_highlights = {
				IncSearch = { fg = colors.main.blue, bg = custom_color.search, underline = false },
				CurSearch = { fg = colors.main.blue, bg = custom_color.search, underline = false },
				CursorLine = { bg = custom_color.selection },
				Search = { fg = '', bg = '', underline = false },
				TelescopeSelection = { fg = '', bg = custom_color.selection },
				TelescopeBorder = { fg = colors.main.paleblue, bg = '' },
				CursorLineNr = { fg = '' },
				TabLineFill = { bg = '' },
				WinSeparator = { fg = colors.main.paleblue },
				CmpItemAbbrMatch = { fg = colors.main.orange, bg = '' },
				CmpItemAbbrMatchFuzzy = { fg = colors.main.orange, bg = '' },
				FloatBorder = { fg = colors.main.paleblue },
				MatchParen = { fg = colors.main.yellow, bg = colors.editor.selection, bold = false },
				MarkdownCodeBlock = { bg = colors.editor.selection },
				CustomMarkdownHeadingUnderline1 = { fg = colors.editor.comments },
				CustomMarkdownHeadingUnderline2 = { fg = colors.editor.line_numbers },
				CustomMarkdownHeadingUnderline3 = { fg = colors.editor.line_numbers },
				CustomMarkdownHorizontalRule = { fg = colors.editor.line_numbers },
				MarkdownBold = { fg = colors.editor.fg_dark, bold = true },
				['@markup.heading.1.marker.markdown'] = { fg = colors.main.red, bold = true },
				['@markup.heading.1.markdown'] = { fg = colors.main.red, bold = true },
				['@markup.heading.2.marker.markdown'] = { fg = colors.main.orange, bold = true },
				['@markup.heading.2.markdown'] = { fg = colors.main.orange, bold = true },
				['@markup.heading.3.marker.markdown'] = { fg = colors.main.yellow, bold = true },
				['@markup.heading.3.markdown'] = { fg = colors.main.yellow, bold = true },
				['@markup.heading.4.marker.markdown'] = { fg = colors.main.green, bold = true },
				['@markup.heading.4.markdown'] = { fg = colors.main.green, bold = true },
				['@markup.heading.5.marker.markdown'] = { fg = colors.main.cyan, bold = true },
				['@markup.heading.5.markdown'] = { fg = colors.main.cyan, bold = true },
				['@markup.heading.6.marker.markdown'] = { fg = colors.main.blue, bold = true },
				['@markup.heading.6.markdown'] = { fg = colors.main.blue, bold = true },
				['@markup.raw.markdown_inline'] = { fg = '', bg = custom_color.search, bold = true },
				['@punctuation.special.markdown'] = { fg = colors.main.blue },

				-- - @markup.raw.block.markdown links to @markup markdown
				-- - @none.markdown links to @none markdown
				-- - @comment.bash links to Comment bash
				-- - @spell.bash links to @spell bash
				-- This is a list of possible values
				-- YourHighlightGroup = {
				--     fg = "#SOME_COLOR", -- foreground color
				--     bg = "#SOME_COLOR", -- background color
				--     sp = "#SOME_COLOR", -- special color (for colored underlines, undercurls...)
				--     bold = false, -- make group bold
				--     italic = false, -- make group italic
				--     underline = false, -- make group underlined
				--     undercurl = false, -- make group undercurled
				--     underdot = false, -- make group underdotted
				--     underdash = false, -- make group underslashed
				--     striketrough = false, -- make group striked through
				--     reverse = false, -- reverse the fg and bg colors
				--     link = "SomeOtherGroup" -- link to some other highlight group
				-- }
			}, -- Overwrite highlights with your own
			custom_colors = function(colors) -- If you want to override the default colors, set this to a function
				colors.editor.selection = custom_color.selection
			end,
		})

		vim.cmd('colorscheme material')
	end,
}
