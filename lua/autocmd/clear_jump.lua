-----------------------------------
-- Clear Jump when Enter the Vim --
-----------------------------------
vim.api.nvim_create_autocmd('VimEnter', {
	pattern = '*',
	callback = function()
		vim.cmd('clearjumps')
	end,
})
