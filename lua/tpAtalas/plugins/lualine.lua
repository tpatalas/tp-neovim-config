-- https://github.com/nvim-lualine/lualine.nvim
-- import lualine plugin safely
local status, lualine = pcall(require, 'lualine')
if not status then
	return
end

-- https://rosepinetheme.com/palette
local colors = {
	foam = '#9ccfd8',
	pine = '#31748f',
	rose = '#ebbcba',
	iris = '#c4a7e7',
	gold = '#f6c177',
	base = '#13111b',
	love = '#eb6f92',
	muted = '#6e6a86',
	subtle = '#908caa',
	text = '#e0def4',
	overlay = '#26233a',
	surface = '#1f1d2e',
	visual = '#5caeef',
	blackhole = '#0a0a0a',
	highlight_high = '#524f67',
	highlight_med = '#403d52',
	highlight_low = '#21202e',
}

local custom_theme = {
	normal = {
		a = { gui = 'bold', fg = colors.foam, bg = colors.surface },
		b = { fg = colors.subtle, bg = colors.surface },
		c = { fg = colors.text, bg = colors.surface },
		x = { fg = colors.text, bg = colors.surface },
		y = { fg = colors.subtle, bg = colors.surface },
		z = { fg = colors.subtle, bg = colors.surface },
	},
	insert = {
		a = { gui = 'bold', fg = colors.iris, bg = colors.surface },
		b = { fg = colors.iris, bg = colors.surface },
		c = { fg = colors.iris, bg = colors.surface },
		x = { fg = colors.iris, bg = colors.surface },
		y = { fg = colors.iris, bg = colors.surface },
		z = { fg = colors.iris, bg = colors.surface },
	},
	visual = {
		a = { gui = 'bold', fg = colors.visual, bg = colors.surface },
		b = { fg = colors.visual, bg = colors.surface },
		c = { fg = colors.visual, bg = colors.surface },
		x = { fg = colors.visual, bg = colors.surface },
		y = { fg = colors.visual, bg = colors.surface },
		z = { fg = colors.visual, bg = colors.surface },
	},
	command = {
		a = {
			gui = 'bold',
			bg = colors.gold,
			fg = colors.base,
		},
	},
	inactive = {
		a = { fg = colors.subtle, bg = colors.highlight_low },
		b = { fg = colors.muted, bg = colors.blackhole },
		c = { fg = colors.muted, bg = colors.blackhole },
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
		lualine_x = { 'filetype', 'filesize' },
		lualine_y = { 'progress' },
		lualine_z = {
			'location',
			{
				'diff',
				symbols = { added = ' ', modified = '柳', removed = ' ' },
				diff_color = {
					added = { fg = colors.foam },
					modified = { fg = colors.gold },
					removed = { fg = colors.love },
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
