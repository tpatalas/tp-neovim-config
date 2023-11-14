local noremap = { noremap = true, silent = true }

function Toggle_quickfix()
	local quickfix_winid = vim.fn.getqflist({ winid = 0 }).winid
	if quickfix_winid == 0 then
		vim.cmd('copen')
		vim.cmd('wincmd L')
		vim.cmd('vertical resize 40')
	else
		vim.cmd('cclose')
	end
end

return {
	'dmmulroy/tsc.nvim',
	lazy = true,
	ft = { 'typescript', 'typescriptreact' },
	keys = {
		{ '<leader>to', ':TSC<CR>', noremap },
		{ '<leader>tl', ':lua Toggle_quickfix()<CR>', noremap },
	},
	config = function()
		require('plugins.tsc.autocmd')
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
