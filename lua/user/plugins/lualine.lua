-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

return {
	'nvim-lualine/lualine.nvim',
	config = function()
		local colors = require('tokyonight.colors').setup()

		local total_lines = function()
			return vim.fn.line('$')
		end

		local block = function()
			return '▊'
		end

		local anchor = function()
			return '%='
		end

		---------------------------
		-- Custom LSP statusline --
		---------------------------
		-- NOTE: Downloads Symbol Nerd Font to font books if icons are not rendering correctly
		local lspClients = {
			{ name = 'html', icon = '' },
			{ name = 'ltex', icon = '' },
			{ name = 'typescript', icon = 'ﯤ' },
			{ name = 'dockerls', icon = '' },
			{ name = 'json', icon = '' },
			{ name = 'cssls', icon = '' },
			{ name = 'cssmodules_ls', icon = '' },
			{ name = 'tailwindcss', icon = '󱏿' },
			{ name = 'sumneko_lua', icon = '' },
			{ name = 'emmet_ls', icon = '󰅱' },
			{ name = 'null-ls', icon = '' },
		}

		local lsp = function()
			local clients = vim.lsp.get_active_clients()
			local result = {}
			if next(clients) == nil then
				return ''
			end
			for _, client in ipairs(clients) do
				if client.name == nil then
					return ''
				end
				for _, lsp in ipairs(lspClients) do
					if client.name == lsp.name then
						table.insert(result, lsp.icon)
					end
				end
			end
			table.sort(result, function(a, b)
				return a > b
			end)
			return table.concat(result, '  ')
		end

		local custom_theme = {
			normal = {
				a = { fg = colors.blue, bg = '' },
				b = { fg = colors.fg_dark, bg = '' },
				c = { fg = colors.green1, bg = '' },
				x = { fg = colors.fg_dark, bg = '' },
				y = { fg = colors.fg_dark, bg = '' },
				z = { fg = colors.blue, bg = '' },
			},
			insert = {
				a = { fg = colors.yellow, bg = '' },
				b = { fg = colors.yellow, bg = '' },
				c = { fg = colors.yellow, bg = '' },
				x = { fg = colors.yellow, bg = '' },
				y = { fg = colors.yellow, bg = '' },
				z = { fg = colors.yellow, bg = '' },
			},
			visual = {
				a = { fg = colors.magenta, bg = '' },
				b = { fg = colors.magenta, bg = '' },
				c = { fg = colors.magenta, bg = '' },
				x = { fg = colors.magenta, bg = '' },
				y = { fg = colors.magenta, bg = '' },
				z = { fg = colors.magenta, bg = '' },
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
				x = { fg = colors.fg_gutter, bg = '' },
				y = { fg = colors.fg_gutter, bg = '' },
				z = { fg = colors.fg_gutter, bg = '' },
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
				lualine_a = {
					{
						'mode',
						icon = '▊ ',
						color = { bg = colors.bg_highlight },
						padding = { left = 0, right = 1 },
					},
				},
				lualine_b = {
					{ 'branch', icon = { '', align = 'left' } },
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
				lualine_c = {
					{
						require('lazy.status').updates,
						cond = require('lazy.status').has_updates,
						color = { fg = colors.orange },
					},
					{ anchor },
					{ anchor },
					{ lsp, icon = 'LSP ' },
				},
				lualine_x = { { anchor }, 'filetype' },
				lualine_y = {
					{ 'location' },
					{ 'progress', icon = 'ﴜ' },
				},
				lualine_z = {
					{ total_lines, icon = 'ﴴ' },
					{
						'filesize',
						icon = '',
					},
					{
						'diff',
						symbols = { added = ' ', modified = '柳', removed = ' ' },
						diff_color = {
							added = { fg = colors.cyan },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
					},
					{ block, padding = 0.4 },
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
			tabline = {
				lualine_c = {
					{
						'buffers',
						max_length = vim.o.columns * 9 / 10, -- Maximum width of tabs component.
						mode = 2,
						buffers_color = {
							active = { fg = colors.green1, bg = colors.terminal_black }, -- Color for active tab.
							inactive = { fg = colors.comment, bg = colors.bg_dark }, -- Color for inactive tab.
						},
					},
				},
			},
			winbar = {},
			inactive_winbar = {},
			extensions = { 'toggleterm', 'nvim-tree' },
		})
	end,
}
