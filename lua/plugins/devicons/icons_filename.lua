-- https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons/icons-default.lua
local devicons = require('nvim-web-devicons').get_icons()

return {
	['.gitignore'] = devicons.git,
	['.gitattributes'] = devicons.git,
	['tsconfig.tsbuildinfo'] = {
		icon = '',
		color = '#519aba',
		name = 'Ts',
	},
	['.env.local'] = {
		icon = '',
		color = '#faf743',
		name = 'Env',
	},
}
