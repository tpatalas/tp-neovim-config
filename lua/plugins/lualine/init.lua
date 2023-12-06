local colorscheme = require('plugins.colorscheme').name

return {
	'nvim-lualine/lualine.nvim',
	event = 'BufReadPre',
	config = function()
		local custom_components = require('plugins.lualine.custom_components')
		local component_colors = require('plugins.colorscheme.extends.lualine.component_colors.' .. colorscheme)
		local custom_theme = require('plugins.colorscheme.extends.lualine.custom_theme.' .. colorscheme)
		local colors = require('plugins.colorscheme.palettes.' .. colorscheme)
		local component = component_colors(colors)

		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = custom_theme(colors),
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
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{ 'mode', icon = ' ' },
				},
				lualine_b = {},
				lualine_c = {
					{ 'filetype', padding = { left = 1, right = 0 } },
					{ 'encoding', padding = { left = 1, right = 0 } },
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
						custom_components.quickfix_count,
						icon = { '󰛦', align = 'left' },
						color = component.diff_color.removed,
					},
					{
						require('lazy.status').updates,
						cond = require('lazy.status').has_updates,
						color = component.lazy,
					},
				},
				lualine_x = {
					{ custom_components.search_count, icon = '', color = component.search_count },
					{
						custom_components.path_winbar,
						icon = { '', align = 'left' },
						color = component.path_winbar,
					},
					{ custom_components.anchor },
				},
				lualine_y = {
					-- { 'progress', icon = '', padding = { left = 0, right = 1 } },
					-- { 'location', icon = '', padding = { left = 0, right = 1 } },
					{ 'filesize', icon = '', padding = { left = 0, right = 1 } },
					{ custom_components.total_lines_file, icon = '', padding = { left = 0, right = 1 } },
					{
						'diff',
						symbols = { added = ' ', modified = ' ', removed = ' ' },
						diff_color = component.diff_color,
					},
				},
				lualine_z = {},
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
