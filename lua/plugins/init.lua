-- https://github.com/folke/lazy.nvim

return {
	'nvim-lua/plenary.nvim', -- lua functions that many plugins use
	'vim-scripts/ReplaceWithRegister', -- replace with register contents using motion (gr + motion)
	'numToStr/Comment.nvim',
	'nvim-tree/nvim-web-devicons',
	{
		'andymass/vim-matchup',
		lazy = true,
		config = function()
			vim.g.matchup_matchparen_offscreen = ''
		end,
	},
}
