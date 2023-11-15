------------------
-- set filetype --
------------------

local fileTypesForShell = {
	'.env*',
	'.aliases',
}

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = fileTypesForShell,
	command = 'setfiletype sh',
})
