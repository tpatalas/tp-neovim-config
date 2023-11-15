-----------------------------------------
-- conditional textwidth and wrap text --
-----------------------------------------
local conditionalWrapText = vim.api.nvim_create_augroup('MarkdownWrap', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
	group = conditionalWrapText,
	pattern = 'markdown',
	command = 'set textwidth=80 wrap',
})

vim.api.nvim_create_autocmd('FileType', {
	group = conditionalWrapText,
	pattern = 'gitcommit',
	command = 'set colorcolumn=50,80',
})
