return {
	'kdheepak/lazygit.nvim',
	lazy = true,
	cmd = {
		'LazyGit',
		'LazyGitConfig',
		'LazyGitCurrentFile',
		'LazyGitFilter',
		'LazyGitFilterCurrentFile',
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	keys = {
		{ '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
	},
	config = function()
		vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
	end,
}
