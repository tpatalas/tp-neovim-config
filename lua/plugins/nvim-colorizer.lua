-- https://github.com/norcalli/nvim-colorizer.lua

local noremap = { noremap = true, silent = true }

return {
	'norcalli/nvim-colorizer.lua',
	lazy = true,
	keys = {
		{ '<leader>cro', ':ColorizerToggle<CR>', noremap }, -- toggle colorizer
	},
}
