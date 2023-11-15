-----------------------------------
-- remove all trailing whitespce --
-----------------------------------
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = function()
		vim.cmd([[:%s/\s\+$//e]])
	end,
})
