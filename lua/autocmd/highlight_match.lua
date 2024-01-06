-------------------------------------------------------------
-- highlight and autosave the match under cursor with delay--
-------------------------------------------------------------
local function clearHighlight()
	vim.cmd('match none')
end

local function isCursorOnWord()
	local current_line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2] + 1
	local char = string.sub(current_line, col, col)
	return char:match('%w') ~= nil
end

local function highlightCurrentWord()
	if not isCursorOnWord() then
		return
	end
	local word = vim.fn.expand('<cword>')
	local escaped_word = vim.fn.escape(word, '/\\')
	if escaped_word ~= '' then
		vim.cmd(string.format('match IncSearch /\\V\\<%s\\>/', escaped_word))
	end
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

local timer = nil
local delay_ms = 500
local last_position = nil

local function startHighlightTimer()
	if timer then
		vim.fn.timer_stop(timer)
	end
	timer = vim.fn.timer_start(delay_ms, function()
		local current_position = vim.api.nvim_win_get_cursor(0)
		if current_position[1] == last_position[1] and current_position[2] == last_position[2] then
			if shouldHighlight() then
				highlightCurrentWord()
			end
		end
	end)
end

vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
	group = group,
	pattern = '*',
	callback = function()
		clearHighlight()
		last_position = vim.api.nvim_win_get_cursor(0)
		startHighlightTimer()
	end,
})

vim.api.nvim_create_autocmd('BufLeave', {
	group = group,
	pattern = '*',
	callback = function()
		clearHighlight()
	end,
})
