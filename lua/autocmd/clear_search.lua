----------------------------------
-- clear search when unload Buf --
----------------------------------
vim.api.nvim_create_autocmd('BufUnload', {
	pattern = '*',
	callback = function()
		vim.fn.setreg('/', '') -- Equivalent to :let @/ = ""
	end,
})
