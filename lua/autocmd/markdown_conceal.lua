vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufRead', 'BufNewFile' }, {
	pattern = '*.md',
	callback = function()
		-- prevent [[]] to be concealed as quote such as wiki link from Obsidian
		vim.cmd([[syntax match MarkdownNoConceal '\[\[.\{-}\]\]' containedin=ALL]])
		-- conceal quote in markdown
		vim.cmd([[syntax match MarkdownConcealGreater /^>/ contains=MarkdownNoConceal conceal cchar=┃]])
		-- prevent codeblock comment get concealed
		vim.cmd([[syntax region MarkdownCodeBlock start=/```/ end=/```/ keepend]])
		-- conceal Headers (nerdfonts are used)
		vim.cmd([[syntax match MarkdownConcealH1 '^#\ze\s' conceal cchar=󰉫]])
		vim.cmd([[syntax match MarkdownConcealH2 '^##\ze\s' conceal cchar=󰉬]])
		vim.cmd([[syntax match MarkdownConcealH3 '^###\ze\s' conceal cchar=󰉭]])
		vim.cmd([[syntax match MarkdownConcealH4 '^####\ze\s' conceal cchar=󰉮]])
		vim.cmd([[syntax match MarkdownConcealH5 '^#####\ze\s' conceal cchar=󰉯]])
		vim.cmd([[syntax match MarkdownConcealH6 '^######\ze\s' conceal cchar=󰉰]])

		vim.wo.conceallevel = 1
	end,
})
