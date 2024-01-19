-- https://github.com/dmmulroy/tsc.nvim

local noremap = { noremap = true, silent = true }
vim.g.did_run_tsc_globally = false

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
		require('tsc').setup({
			auto_open_qflist = false,
			auto_close_qflist = false,
			-- auto_start_watch_mode = true,
			bin_path = require('tsc.utils').find_tsc_bin(),
			enable_progress_notifications = false,
			flags = {
				noEmit = true,
				watch = true,
			},
			hide_progress_notifications_from_history = true,
			spinner = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
		})

		vim.api.nvim_create_autocmd('BufEnter', {
			pattern = { '*.ts', '*.tsx' },
			callback = function()
				if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'typescriptreact' then
					if not vim.g.did_run_tsc_globally then
						vim.cmd('TSC')
						vim.g.did_run_tsc_globally = true
					end
				end
			end,
		})
	end,
}
