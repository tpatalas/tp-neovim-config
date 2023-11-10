return function(colors)
	return {
		lazy = { fg = colors.gold },
		search_count = { fg = colors.rose },
		path_winbar = { fg = colors.muted },
		diff_color = {
			added = { fg = colors.pine },
			modified = { fg = colors.rose },
			removed = { fg = colors.love },
		},
	}
end
