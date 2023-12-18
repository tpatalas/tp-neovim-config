-- https://github.com/folke/lazy.nvim

return {
	'nvim-lua/plenary.nvim', -- lua functions that many plugins use
	{
		'andymass/vim-matchup',
		lazy = true,
		config = function()
			vim.g.matchup_matchparen_offscreen = ''
		end,
	},
}
