vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	callback = function()
		if vim.bo.filetype ~= 'markdown' then
			vim.wo.conceallevel = 0
		end
	end,
})
