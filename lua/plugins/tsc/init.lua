local noremap = { noremap = true, silent = true }

return {
	'dmmulroy/tsc.nvim',
	lazy = true,
	ft = { 'typescript', 'typescriptreact' },
	keys = {
		{ '<leader>to', ':TSC<CR>', noremap },
	},
	config = function()
		require('tsc').setup({
			auto_open_qflist = false,
			auto_close_qflist = false,
			bin_path = require('tsc.utils').find_tsc_bin(),
			enable_progress_notifications = false,
			flags = {
				noEmit = true,
			},
			hide_progress_notifications_from_history = true,
			spinner = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
		})
	end,
}
