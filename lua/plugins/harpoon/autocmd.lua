----------------------------------
-- Add Harpoon before leave vim --
----------------------------------
local excluded_filetypes = { 'oil', 'gitcommit' }
local excluded_filenames = { 'wezterm.lua' }

local function isFileTypeExcluded()
	local filetype = vim.bo.filetype
	for _, ft in ipairs(excluded_filetypes) do
		if filetype == ft then
			return true
		end
	end
	return false
end

local function isFileNameExcluded()
	local filename = vim.fn.expand('%:t')
	for _, fn in ipairs(excluded_filenames) do
		if filename == fn then
			return true
		end
	end
	return false
end

local function isFileEmpty()
	return vim.fn.line('$') <= 1 and vim.fn.getline(1) == ''
end

local function addToHarpoon()
	if not isFileTypeExcluded() and not isFileNameExcluded() and not isFileEmpty() then
	-- require('harpoon.mark').clear_all()
		require('harpoon.mark').add_file()
	end
end

vim.api.nvim_create_augroup('AutoAddHarpoon', { clear = true })
vim.api.nvim_create_autocmd('VimLeave', {
	group = 'AutoAddHarpoon',
	callback = addToHarpoon,
})
