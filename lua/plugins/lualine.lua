-- https://github.com/nvim-lualine/lualine.nvim

return {
	'nvim-lualine/lualine.nvim',
	config = function()
		local palette = require('nightfox.palette').load('nightfox')

		local custom_theme = {
			normal = {
				a = { fg = palette.blue.base, bg = palette.bg0 },
				b = { fg = palette.fg2, bg = palette.bg0 },
				c = { fg = palette.green.base, bg = palette.bg0 },
				x = { fg = palette.fg3, bg = palette.bg0 },
				y = { fg = palette.green.base, bg = palette.bg0 },
				z = { fg = palette.blue.base, bg = palette.bg0 },
			},
			insert = {
				a = { fg = palette.yellow.base, bg = palette.bg0 },
				b = { fg = palette.yellow.base, bg = palette.bg0 },
				c = { fg = palette.yellow.base, bg = palette.bg0 },
				x = { fg = palette.yellow.base, bg = palette.bg0 },
				y = { fg = palette.yellow.base, bg = palette.bg0 },
				z = { fg = palette.yellow.base, bg = palette.bg0 },
			},
			visual = {
				a = { fg = palette.magenta.base, bg = palette.bg0 },
				b = { fg = palette.magenta.base, bg = palette.bg0 },
				c = { fg = palette.magenta.base, bg = palette.bg0 },
				x = { fg = palette.magenta.base, bg = palette.bg0 },
				y = { fg = palette.magenta.base, bg = palette.bg0 },
				z = { fg = palette.magenta.base, bg = palette.bg0 },
			},
			command = {
				a = { fg = palette.orange.base, bg = palette.bg0 },
				b = { fg = palette.orange.base, bg = palette.bg0 },
				c = { fg = palette.orange.base, bg = palette.bg0 },
				x = { fg = palette.orange.base, bg = palette.bg0 },
				y = { fg = palette.orange.base, bg = palette.bg0 },
				z = { fg = palette.orange.base, bg = palette.bg0 },
			},
			inactive = {
				a = { fg = palette.fg0, bg = palette.bg0 },
				b = { fg = palette.fg0, bg = palette.bg0 },
				c = { fg = palette.fg0, bg = palette.bg0 },
				x = { fg = palette.fg0, bg = palette.bg0 },
				y = { fg = palette.fg0, bg = palette.bg0 },
				z = { fg = palette.fg0, bg = palette.bg0 },
			},
		}

		local total_lines_file = function()
			return vim.fn.line('$')
		end

		local anchor = function()
			return '%='
		end

		function search_count()
			local res = vim.fn.searchcount({ maxcount = 1000, timeout = 500 })

			if res.total > 0 then
				return string.format('%s/%d %s', res.current, res.total, vim.fn.getreg('/'))
			else
				return palette.bg0
			end
		end

		---------------------------
		-- Custom LSP statusline --
		---------------------------
		-- NOTE: Downloads Symbol Nerd Font to font books if icons are not rendering correctly

		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = custom_theme,
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
						padding = { left = 1, right = 1 },
					},
				},
				lualine_b = {
					{ 'branch', icon = { '', align = 'left' }, color },
					{ 'encoding', icon = '' },
					{
						'diagnostics',
						sources = { 'nvim_workspace_diagnostic' },
						symbols = { error = ' ', warn = ' ', info = ' ', hint = 'ﴞ ' },
						sections = { 'error', 'warn', 'info', 'hint' },
						colored = true,
						update_in_insert = true,
						always_visible = false,
					},
				},
				lualine_c = {
					{
						require('lazy.status').updates,
						cond = require('lazy.status').has_updates,
						color = { fg = palette.orange.base },
					},
					{ search_count, icon = '󰍉' },
				},
				lualine_x = {
					{ anchor },
					{ 'location', icon = '' },
					{ 'progress', icon = '' },
				},
				lualine_y = {
					{ total_lines_file, icon = '' },
					{ 'filesize', icon = '' },
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
