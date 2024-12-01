local colorscheme = require('plugins.colorscheme').name

return {
	'nvim-lualine/lualine.nvim',
	lazy = true,
	event = 'VeryLazy',
	config = function()
		local custom_components = require('plugins.lualine.custom_components')
		local component_colors = require('plugins.colorscheme.extends.lualine.component_colors.' .. colorscheme)
		local custom_theme = require('plugins.colorscheme.extends.lualine.custom_theme.' .. colorscheme)
		local colors = require('plugins.colorscheme.palettes.' .. colorscheme)
		local global_icons = require('utils.global_icons')
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
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {
					{ 'mode', icon = ' ' },
				},
				lualine_b = {},
				lualine_c = {
					{ 'filetype', padding = { left = 1, right = 0 } },
					{ 'branch', color = component.branch },
					{
						'diagnostics',
						sources = { 'nvim_workspace_diagnostic' },
						symbols = {
							error = global_icons.error,
							warn = global_icons.warn,
							info = global_icons.info,
							hint = global_icons.hint,
						},
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
				},
				lualine_x = {
					-- { require('lazy.status').updates, cond = require('lazy.status').has_updates, color = component.lazy },
					{ custom_components.search_count, icon = '󰍉', color = component.search_count },
					{ custom_components.anchor },
				},
				lualine_y = {
					-- { 'progress', icon = '', padding = { left = 0, right = 1 } },
					-- { 'location', icon = '', padding = { left = 0, right = 1 } },
					{ custom_components.char_count, icon = '', padding = { left = 1, right = 1 } },
					-- { 'encoding', padding = { left = 1, right = 1 } },
					{ 'filesize', icon = '', padding = { left = 1, right = 1 } },
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
			tabline = {
				lualine_a = {
					{ custom_components.path_winbar, color = component.path_winbar, padding = { left = 2 } },
				},
			},
			-- winbar = {
			-- 	lualine_a = {
			-- 		{ custom_components.path_winbar, color = component.path_winbar, padding = { left = 2 } },
			-- 	},
			-- },
			-- inactive_winbar = {
			-- 	lualine_a = {
			-- 		{ custom_components.path_winbar, color = component.path_winbar, padding = { left = 2 } },
			-- 	},
			-- },
		})
	end,
}
