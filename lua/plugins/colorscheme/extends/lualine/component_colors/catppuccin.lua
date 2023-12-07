return function(colors)
	return {
		lazy = { fg = colors.yellow },
		search_count = { fg = colors.yellow },
		path_winbar = { fg = colors.crest },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
	}
end
