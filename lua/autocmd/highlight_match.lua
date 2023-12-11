---------------------------------------------------
-- highlight and autosave the match under cursor --
---------------------------------------------------
local function highlightCurrentWord(event)
	local word = event ~= '' and event or vim.fn.expand('<cword>')
	local escaped_word = vim.fn.escape(word, '/\\')
	vim.cmd(string.format('match IncSearch /\\V\\<%s\\>/', escaped_word))
end

local group = vim.api.nvim_create_augroup('AutoHighlight', { clear = true })

local excluded_filetypes = {
	'neo-tree',
	'oil',
}

local function shouldHighlight()
	local filetype = vim.bo.filetype
	for _, excluded_type in ipairs(excluded_filetypes) do
		if filetype == excluded_type then
			return false
		end
	end
	return true
end

vim.api.nvim_create_autocmd({ 'CursorMovedI', 'CursorMoved' }, {
	group = group,
	pattern = '*',
	callback = function()
		if shouldHighlight() then
			highlightCurrentWord('')
		end
	end,
})
