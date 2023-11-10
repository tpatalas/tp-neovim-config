return function(colors)
	return {
		lazy = { fg = colors.yellow },
		search_count = { fg = colors.yellow },
		path_winbar = { fg = colors.fg3 },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.pink },
		},
	}
end
