-- https://github.com/folke/lazy.nvim

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

require('lazy').setup('plugins', {
	change_detection = {
		enabled = true,
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false, -- notify is not required since already integrated with lualine. Lazy will show a number of available updates on the lualine
		frequency = 86400, -- every 24 hours
	},
	ui = {
		border = 'rounded',
		backdrop = 100, -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
	},
})
