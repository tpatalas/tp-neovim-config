---------------
-- auto save --
---------------
local last_time = 0

vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'InsertLeave' }, {
	pattern = '*.*',
	callback = function()
		if vim.bo.filetype ~= 'gitcommit' and vim.fn.expand('%') ~= 'wezterm.lua' then
			local current_time = vim.fn.reltimefloat(vim.fn.reltime())
			if current_time - last_time > 0.5 then -- Check if 300ms have passed
				last_time = current_time
				vim.cmd('silent! write!')
			end
		end
	end,
})
