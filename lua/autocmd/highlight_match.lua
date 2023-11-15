---------------------------------------------------
-- highlight and autosave the match under cursor --
---------------------------------------------------
local function highlightCurrentWord(event)
	local word = event ~= '' and event or vim.fn.expand('<cword>')
	local escaped_word = vim.fn.escape(word, '/\\')
	vim.cmd(string.format('match IncSearch /\\V\\<%s\\>/', escaped_word))
end

local group = vim.api.nvim_create_augroup('AutoHighlight', { clear = true })

vim.api.nvim_create_autocmd('CursorHold', {
	group = group,
	pattern = '*',
	callback = function()
		if not string.find(vim.fn.expand('%'), 'neo-tree') then
			highlightCurrentWord()
		end
	end,
})

vim.api.nvim_create_autocmd({ 'CursorMovedI', 'CursorMoved' }, {
	group = group,
	pattern = '*',
	callback = function()
		highlightCurrentWord('')
	end,
})
