------------------------
-- auto cursor shape --
-----------------------

-- Create an auto-command group 'BlinkCursor'
local blinkCursorGroup = vim.api.nvim_create_augroup('BlinkCursor', { clear = true })

-- Define the auto-command within the group
vim.api.nvim_create_autocmd('VimEnter', {
	group = blinkCursorGroup,
	pattern = '*',
	callback = function()
		vim.o.guicursor = 'n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50'
			.. ',a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
			.. ',sm:block-blinkwait175-blinkoff150-blinkon175'
	end,
})
