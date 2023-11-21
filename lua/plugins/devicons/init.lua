-- https://github.com/nvim-tree/nvim-web-devicons

return {
	'nvim-tree/nvim-web-devicons',
config = function()
		local icons_filename = require('plugins.devicons.icons_filename')

		require('nvim-web-devicons').setup({
			override = {},
			color_icons = true,
			default = true,
			strict = true,
			override_by_filename = icons_filename,
			override_by_extension = {},
		})
	end,
}
