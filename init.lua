local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

vim.g.hardtime_default_on = 0
vim.g.hardtime_ignore_quickfix = 1
vim.g.hardtime_maxcount = 3
vim.g.hardtime_motion_with_count_resets = 1
vim.g.hardtime_allow_different_key = 1
vim.g.hardtime_ignore_buffer_patterns = { 'nvim-cmp' }

require('user.core.options')
require('user.core.keymaps')
require('user.core.autocmd')

require('lazy').setup('user.plugins', {
	change_detection = {
		enabled = true,
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false, -- integrated with lualine. Lazy will show a number of available updates on the lualine
		frequency = 86400, -- every 24 hours
	},
})
