-----------------------------------
-- Clear Jump when Enter the Vim --
-----------------------------------
vim.api.nvim_create_autocmd('VimEnter', {
	pattern = '*',
	callback = function()
	l	vim.cmd('clearjumps')
	end,
})
