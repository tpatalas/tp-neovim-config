return function(colors)
	return {
		normal = {
			a = { fg = colors.blue, bg = colors.bg_statusline },
			b = { fg = colors.fg, bg = colors.bg_statusline },
			c = { fg = colors.fg, bg = colors.bg_statusline },
			x = { fg = colors.fg, bg = colors.bg_statusline },
			y = { fg = colors.fg, bg = colors.bg_statusline },
			z = { fg = colors.green, bg = colors.bg_statusline },
		},
		insert = {
			a = { fg = colors.orange, bg = colors.bg_statusline },
			b = { fg = colors.orange, bg = colors.bg_statusline },
			c = { fg = colors.orange, bg = colors.bg_statusline },
			x = { fg = colors.orange, bg = colors.bg_statusline },
			y = { fg = colors.orange, bg = colors.bg_statusline },
			z = { fg = colors.orange, bg = colors.bg_statusline },
		},
		visual = {
			a = { fg = colors.purple, bg = colors.bg_statusline },
			b = { fg = colors.purple, bg = colors.bg_statusline },
			c = { fg = colors.purple, bg = colors.bg_statusline },
			x = { fg = colors.purple, bg = colors.bg_statusline },
			y = { fg = colors.purple, bg = colors.bg_statusline },
			z = { fg = colors.purple, bg = colors.bg_statusline },
		},
		command = {
			a = { fg = colors.yellow, bg = colors.bg_statusline },
			b = { fg = colors.yellow, bg = colors.bg_statusline },
			c = { fg = colors.yellow, bg = colors.bg_statusline },
			x = { fg = colors.yellow, bg = colors.bg_statusline },
			y = { fg = colors.yellow, bg = colors.bg_statusline },
			z = { fg = colors.yellow, bg = colors.bg_statusline },
		},
		inactive = {
			a = { fg = colors.bg_float, bg = colors.bg_statusline },
			b = { fg = colors.bg_float, bg = colors.bg_statusline },
			c = { fg = colors.bg_float, bg = colors.bg_statusline },
			x = { fg = colors.bg_float, bg = colors.bg_statusline },
			y = { fg = colors.bg_float, bg = colors.bg_statusline },
			z = { fg = colors.bg_float, bg = colors.bg_statusline },
		},
	}
end
