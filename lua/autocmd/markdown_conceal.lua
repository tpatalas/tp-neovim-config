vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufRead', 'BufNewFile' }, {
	pattern = '*.md',
	callback = function()
		-- prevent [[]] to be concealed as quote such as wiki link from Obsidian
		vim.cmd([[syntax match MarkdownNoConceal '\[\[.\{-}\]\]' containedin=ALL]])

		-- prevent codeblock comment get concealed
		vim.cmd([[syntax region MarkdownCodeBlock start=/```/ end=/```/ keepend]])
		-- conceal Headers (nerdfonts are used)
		vim.cmd([[syntax match MarkdownConcealH1 '^#\ze\s' conceal cchar=󰉫]])
		vim.cmd([[syntax match MarkdownConcealH2 '^##\ze\s' conceal cchar=󰉬]])
		vim.cmd([[syntax match MarkdownConcealH3 '^###\ze\s' conceal cchar=󰉭]])
		vim.cmd([[syntax match MarkdownConcealH4 '^####\ze\s' conceal cchar=󰉮]])
		vim.cmd([[syntax match MarkdownConcealH5 '^#####\ze\s' conceal cchar=󰉯]])
		vim.cmd([[syntax match MarkdownConcealH6 '^######\ze\s' conceal cchar=󰉰]])
		-- conceal strikethrough
		vim.cmd('highlight MarkdownStrikethrough gui=strikethrough')
		vim.cmd([[syntax match MarkdownStrikethrough '\v(\s|\_^)\~\~[^~]+\~\~(\s|\_$)' contains=MarkdownCodeBlock]])
		-- conceal italic
		vim.cmd('highlight MarkdownItalic gui=italic')
		vim.cmd(
			[[syntax match MarkdownItalic '\v(\s|\_^)\*[^*]+\*(\s|\_$)' contains=MarkdownStrikethrough,MarkdownCodeBlock]]
		)
		-- conceal bold
		vim.cmd('highlight MarkdownBold gui=bold')
		vim.cmd(
			[[syntax match MarkdownBold '\v(\s|\_^)\*\*[^*]+\*\*(\s|\_$)' contains=MarkdownStrikethrough,MarkdownItalic,MarkdownCodeBlock]]
		)
		-- conceal bold and italic
		vim.cmd('highlight MarkdownBoldItalic gui=bolditalic')
		vim.cmd(
			[[syntax match MarkdownBoldItalic '\v(\s|\_^)\*\*\*[^*]+\*\*\*(\s|\_$)' contains=MarkdownStrikethrough,MarkdownCodeBlock]]
		)

		vim.wo.conceallevel = 2
	end,
})
