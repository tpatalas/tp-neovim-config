return function(colors)
	return {
		lazy = { fg = colors.yellow },
		search_count = { fg = colors.orange },
		path_winbar = { fg = colors.fg_dark },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.orange },
			removed = { fg = colors.red },
		},
	}
end
