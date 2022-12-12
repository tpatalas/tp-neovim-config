-- https://github.com/nvim-lualine/lualine.nvim
-- import lualine plugin safely
local status, lualine = pcall(require, 'lualine')
if not status then
	return
end

-- https://github.com/EdenEast/nightfox.nvim/blob/main/usage.md#palette
local palette = require('nightfox.palette').load('nightfox')

local total_lines = function()
	return vim.fn.line('$')
end

local custom_theme = {
	normal = {
		a = { gui = 'bold', fg = palette.blue.bright, bg = palette.bg2 },
		b = { fg = palette.fg3, bg = palette.bg2 },
		c = { fg = palette.yellow.dim, bg = palette.bg2 },
		x = { fg = palette.fg2, bg = palette.bg2 },
		y = { fg = palette.fg3, bg = palette.bg2 },
		z = { fg = palette.yellow.base, bg = palette.bg2 },
	},
	insert = {
		a = { gui = 'bold', fg = palette.cyan.base, bg = palette.bg2 },
		b = { fg = palette.cyan.base, bg = palette.bg2 },
		c = { fg = palette.cyan.base, bg = palette.bg2 },
		x = { fg = palette.cyan.base, bg = palette.bg2 },
		y = { fg = palette.cyan.base, bg = palette.bg2 },
		z = { fg = palette.cyan.base, bg = palette.bg2 },
	},
	visual = {
		a = { gui = 'bold', fg = palette.magenta.base, bg = palette.bg2 },
		b = { fg = palette.magenta.base, bg = palette.bg2 },
		c = { fg = palette.magenta.base, bg = palette.bg2 },
		x = { fg = palette.magenta.base, bg = palette.bg2 },
		y = { fg = palette.magenta.base, bg = palette.bg2 },
		z = { fg = palette.magenta.base, bg = palette.bg2 },
	},
	command = {
		a = {
			gui = 'bold',
			bg = palette.orange.base,
			fg = palette.fg1,
		},
	},
	inactive = {
		a = { fg = palette.bg4, bg = palette.bg0 },
		b = { fg = palette.bg4, bg = palette.bg0 },
		c = { fg = palette.bg4, bg = palette.bg0 },
	},
}

lualine.setup({
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
				sources = { 'nvim_lsp', 'nvim_workspace_diagnostic', 'nvim_diagnostic' },
				symbols = { error = ' ', warn = ' ', info = ' ' },
				sections = { 'error', 'warn', 'info' },
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
					added = { fg = palette.cyan.base },
					modified = { fg = palette.orange.base },
					removed = { fg = palette.red.base },
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
				shorting_target = 40,
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
