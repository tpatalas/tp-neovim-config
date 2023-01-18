-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

return {
	'nvim-lualine/lualine.nvim',
	config = function()
		local colors = require('tokyonight.colors').setup() -- pass in any of the config options as explained above

		local total_lines = function()
			return vim.fn.line('$')
		end

		local custom_theme = {
			normal = {
				a = { fg = colors.blue, bg = colors.bg_dark },
				b = { fg = colors.fg_float, bg = colors.bg_dark },
				c = { fg = colors.yellow, bg = colors.bg_dark },
				x = { fg = colors.fg_float, bg = colors.bg_dark },
				y = { fg = colors.fg_float, bg = colors.bg_dark },
				z = { fg = colors.yellow, bg = colors.bg_dark },
			},
			insert = {
				a = { fg = colors.cyan, bg = colors.bg_dark },
				b = { fg = colors.cyan, bg = colors.bg_dark },
				c = { fg = colors.cyan, bg = colors.bg_dark },
				x = { fg = colors.cyan, bg = colors.bg_dark },
				y = { fg = colors.cyan, bg = colors.bg_dark },
				z = { fg = colors.cyan, bg = colors.bg_dark },
			},
			visual = {
				a = { fg = colors.magenta, bg = colors.bg_dark },
				b = { fg = colors.magenta, bg = colors.bg_dark },
				c = { fg = colors.magenta, bg = colors.bg_dark },
				x = { fg = colors.magenta, bg = colors.bg_dark },
				y = { fg = colors.magenta, bg = colors.bg_dark },
				z = { fg = colors.magenta, bg = colors.bg_dark },
			},
			command = {
				a = {
					bg = colors.orange,
					fg = colors.fg_float,
				},
			},
			inactive = {
				a = { fg = colors.fg_gutter, bg = '' },
				b = { fg = colors.fg_gutter, bg = '' },
				c = { fg = colors.fg_gutter, bg = '' },
			},
		}

		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = custom_theme,
				component_separators = '',
				section_separators = '',
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = {
					{
						'diagnostics',
						sources = { 'nvim_workspace_diagnostic' },
						symbols = { error = ' ', warn = ' ', info = ' ', hint = 'ﴞ ' },
						sections = { 'error', 'warn', 'info', 'hint' },
						colored = true,
						update_in_insert = true,
						always_visible = false,
					},
				},
				lualine_x = { 'filetype' },
				lualine_y = { 'progress', 'location' },
				lualine_z = {
					total_lines,
					'filesize',
					{
						'diff',
						symbols = { added = ' ', modified = '柳', removed = ' ' },
						diff_color = {
							added = { fg = colors.cyan },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
					},
				},
			},
			--
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { 'toggleterm', 'nvim-tree' },
		})
	end,
}
