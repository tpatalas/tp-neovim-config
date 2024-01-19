local function get_included_filetypes(excluded_filetypes)
	local all_filetypes = {
		'lua',
		'python',
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'html',
		'css',
		'scss',
		'sass',
		'dockerfile',
		'gitcommit',
		'gitconfig',
		'bash',
		'json',
		'markdown',
		'vim',
		'sh',
		'c',
		'cpp',
		'go',
		'rust',
		'java',
		'yaml',
		'xml',
		'php',
		'sql',
		'oil',
	}

	local included = {}
	for _, ft in ipairs(all_filetypes) do
		if not vim.tbl_contains(excluded_filetypes, ft) then
			table.insert(included, ft)
		end
	end
	return included
end

return get_included_filetypes
