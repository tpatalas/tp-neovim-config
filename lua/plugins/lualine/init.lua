-- https://github.com/nvim-lualine/lualine.nvim

return {
	'nvim-lualine/lualine.nvim',
	config = function()
		local palette = require('nightfox.palette').load('nightfox')
		local custom_theme = require('plugins.lualine.custom_theme')
		local custom_components = require('plugins.lualine.custom_components')

		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = custom_theme(palette),
				component_separators = ' ',
				section_separators = ' ',
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					-- 30 min
					statusline = 1800000,
					tabline = 1800000,
					winbar = 1800000,
				},
			},
			sections = {
				lualine_a = {
					{
						'mode',
						icon = ' ',
					},
				},
				lualine_b = {
					{ 'branch', icon = { '', align = 'left' } },
				},
				lualine_c = {
					{ 'filetype', padding = { left = 1, right = 0 } },
					{
						'diagnostics',
						sources = { 'nvim_workspace_diagnostic' },
						symbols = { error = ' ', warn = ' ', info = ' ', hint = 'ﴞ ' },
						sections = { 'error', 'warn', 'info', 'hint' },
						colored = true,
						update_in_insert = true,
						always_visible = false,
					},
					{
						require('lazy.status').updates,
						cond = require('lazy.status').has_updates,
						color = { fg = palette.orange.base },
					},
				},
				lualine_x = {
					-- { 'encoding', icon = '' },
					{ custom_components.search_count, icon = '󰍉', color = { fg = palette.pink.bright } },
					{
						'filename',
						path = 4,
						icon = { '', align = 'left' },
						padding = { left = 1, right = 0 },
					},
					{ custom_components.anchor },
				},
				lualine_y = {
					{ 'progress', icon = '', padding = { left = 0, right = 1 } },
					{ 'location', icon = '', padding = { left = 0, right = 1 } },
					{ 'filesize', icon = '', padding = { left = 0, right = 1 } },
					{ custom_components.total_lines_file, icon = '', padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					{
						'diff',
						symbols = { added = ' ', modified = ' ', removed = ' ' },
						diff_color = {
							added = { fg = palette.cyan.base },
							modified = { fg = palette.orange.base },
							removed = { fg = palette.red.base },
						},
					},
				},
			},
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
			extensions = { 'toggleterm' },
		})
	end,
}
