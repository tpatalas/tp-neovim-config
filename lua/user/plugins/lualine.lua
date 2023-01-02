-- https://github.com/nvim-lualine/lualine.nvim
local status, lualine = pcall(require, 'lualine')
if not status then
	return
end
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

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

lualine.setup({
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
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				'buffers',
				show_filename_only = true, -- Shows shortened relative path when set to false.
				hide_filename_extension = true, -- Hide filename extension when set to true.
				show_modified_status = true, -- Shows indicator when the buffer is modified.	mode = 2,
				mode = 2,
				-- 0: Shows buffer name
				-- 1: Shows buffer index
				-- 2: Shows buffer name + buffer index
				-- 3: Shows buffer number
				-- 4: Shows buffer name + buffer number
				symbols = {
					modified = ' ●',
					alternate_file = '',
					directory = '',
				},
				max_length = vim.o.columns * 7 / 10,
			},
		},
		lualine_x = {},
		lualine_y = {
			{
				'filename',
				file_status = true,
				newfile_status = false,
				path = 1,
				shorting_target = 100,
				symbols = {
					modified = '[+]',
					readonly = '[-]',
					unnamed = '',
					newfile = '[New]',
				},
			},
		},
		lualine_z = {},
	},
	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {},
	extensions = { 'toggleterm', 'nvim-tree' },
})
