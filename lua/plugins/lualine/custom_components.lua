local M = {}

M.total_lines_file = function()
	return vim.fn.line('$')
end

M.anchor = function()
	return '%='
end

M.search_count = function()
	local res = vim.fn.searchcount({ maxcount = 1000, timeout = 500 })

	if res.total > 0 then
		return string.format('%s/%d %s', res.current, res.total, vim.fn.getreg('/'))
	else
		return palette.highlight_high
	end
end

M.cwd_folder_name = function()
	local cwd = vim.fn.getcwd()
	return cwd:match('([^/]+)$')
end

M.quickfix_count = function()
	local qflist = vim.fn.getqflist()
	local count = #qflist

	if count > 0 then
		return string.format('%d', count)
	else
		return ''
	end
end

M.path_winbar = function()
	local devicons = require('nvim-web-devicons')
	local fullPath = vim.fn.expand('%:p')
	local cwd = vim.fn.getcwd()
	local startIdx, endIdx = fullPath:find(cwd, 1, true)

	local cwdFolderName = M.cwd_folder_name()
	local cwdIcon = ''

	if not startIdx or startIdx <= 0 then
		return cwdIcon .. ' ' .. cwdFolderName .. ' | ' .. fullPath
	end

	local pathBelowCwd = fullPath:sub(endIdx + 1)
	local file = pathBelowCwd:match('([^/]+)$')

	if not file then
		file = pathBelowCwd:match('([^/]+)/?$')
		pathBelowCwd = pathBelowCwd:gsub('/$', '')
	end

	local extension = file and file:match('%.([^%.]+)$') or ''

	local pathComponents = {}
	for w in pathBelowCwd:gmatch('([^/]+)') do
		pathComponents[#pathComponents + 1] = w
	end

	local icon = ''
	if #pathComponents > 1 then
		icon = extension ~= '' and devicons.get_icon(file, extension) or ''
	end

	local firstPathComponentIcon = ''
	if #pathComponents > 0 then
		pathComponents[1] = firstPathComponentIcon .. ' ' .. pathComponents[1]
	end

	local desiredPath
	if #pathComponents >= 6 then
		desiredPath = table.concat({
			pathComponents[1],
			pathComponents[2],
			'...',
			pathComponents[#pathComponents - 1],
			pathComponents[#pathComponents],
		}, '  ')
	else
		desiredPath = table.concat(pathComponents, '  ')
	end

	if icon ~= '' and file then
		desiredPath = desiredPath:gsub(file, icon .. ' ' .. file, 1)
	end

	return cwdIcon .. ' ' .. cwdFolderName .. ' | ' .. desiredPath
end

return M
