return function(colors)
	return {
		lazy = { fg = colors.main.yellow },
		search_count = { fg = colors.main.orange },
		path_winbar = { fg = colors.editor.fg_dark, bg = '' },
		branch = { fg = colors.main.gray },
		diff_color = {
			added = { fg = colors.main.green },
			modified = { fg = colors.main.orange },
			removed = { fg = colors.main.red },
		},
	}
end
