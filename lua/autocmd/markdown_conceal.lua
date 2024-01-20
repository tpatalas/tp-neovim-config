vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufRead', 'BufNewFile' }, {
	pattern = '*.md',
	callback = function()
		-- conceal quote in markdown
		vim.cmd([[syntax match MarkdownNoConceal '\[\[.\{-}\]\]' containedin=ALL]])
		vim.cmd([[syntax match MarkdownConcealGreater /^>/ contains=MarkdownNoConceal conceal cchar=┃]])

		vim.wo.conceallevel = 2
		vim.wo.concealcursor = 'nc'
	end,
})
