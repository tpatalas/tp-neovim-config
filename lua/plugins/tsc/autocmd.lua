local is_tsc_running = false
local debounce_timer

local function debounceTSCCommand()
	if is_tsc_running then
		return
	end

	if debounce_timer then
		vim.fn.timer_stop(debounce_timer)
	end
	debounce_timer = vim.fn.timer_start(2000, function()
		is_tsc_running = true
		vim.api.nvim_command('TSC')
		is_tsc_running = false
	end)
end

vim.api.nvim_create_augroup('TypeScriptAutocommands', { clear = true })
vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'BufReadPre' }, {
	pattern = { '*.ts', '*.tsx' },
	group = 'TypeScriptAutocommands',
	callback = debounceTSCCommand,
})
