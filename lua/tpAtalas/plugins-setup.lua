-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, 'packer')
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use('wbthomason/packer.nvim')

	use('nvim-lua/plenary.nvim') -- lua functions that many plugins use

	-- colors --
	-- use("joshdick/onedark.vim")
	-- use("folke/tokyonight.nvim")
	use('rose-pine/neovim') -- colorScheme
	-- use("cocopon/iceberg.vim")
	-- use("rebelot/kanagawa.nvim")
	-- use("catppuccin/nvim")

	use('norcalli/nvim-colorizer.lua') -- colorizer

	-- essential plugins
	use('tpope/vim-surround') -- add, delete, change surroundings (it's awesome)
	use('vim-scripts/ReplaceWithRegister') -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use('numToStr/Comment.nvim')

	-- file explorer
	use('nvim-tree/nvim-tree.lua')

	-- vs-code like icons
	use('kyazdani42/nvim-web-devicons')

	-- statusline
	use('nvim-lualine/lualine.nvim')

	-- search and finder
	use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }) -- dependency for better sorting performance
	use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' }) -- fuzzy finder
	-- makesure to install `$ brew install ripgrep` to use livegrep
	use('mg979/vim-visual-multi') -- visual-multi cursor

	-- autocompletion
	use('hrsh7th/nvim-cmp') -- completion plugin
	use('hrsh7th/cmp-buffer') -- source for text in buffer
	use('hrsh7th/cmp-path') -- source for file system paths

	-- snippets
	use('L3MON4D3/LuaSnip') -- snippet engine
	use('saadparwaiz1/cmp_luasnip') -- for autocompletion
	use('rafamadriz/friendly-snippets') -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use('williamboman/mason.nvim') -- in charge of managing lsp servers, linters & formatters
	use('williamboman/mason-lspconfig.nvim') -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use('neovim/nvim-lspconfig') -- easily configure language servers
	use('hrsh7th/cmp-nvim-lsp') -- for autocompletion
	use({ 'glepnir/lspsaga.nvim', branch = 'main' }) -- enhanced lsp uis
	use('onsails/lspkind.nvim') -- vs-code like icons for autocompletion
	use('jose-elias-alvarez/typescript.nvim') -- additional functionality for typescript server (e.g. rename file & update imports)

	-- formatting & linting
	use('jose-elias-alvarez/null-ls.nvim') -- configure formatters & linters
	use('jayp0521/mason-null-ls.nvim') -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use('nvim-treesitter/nvim-treesitter', { 'do', ':TSUpdate' })

	-- auto closing
	use('windwp/nvim-autopairs') -- autoclose parens, brackets, quotes, etc...
	use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }) -- autoclose tags
	use('p00f/nvim-ts-rainbow') -- colorizer

	-- Impatient improve the performance of lua module
	use('lewis6991/impatient.nvim')

	-- git integration
	use('lewis6991/gitsigns.nvim') -- show line modifications on left hand side

	-- toggle multiple terminal -- can also control the lazyGit (installed through homebrew)
	use({
		'akinsho/toggleterm.nvim',
		tag = '*',
		config = function()
			require('toggleterm').setup()
		end,
	})

	-- markdown
	use({
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		setup = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		ft = { 'markdown' },
	}) -- markdown preview

	use('mzlogin/vim-markdown-toc') -- toc generator

	-- trouble
	use('folke/trouble.nvim')

	-- http client
	use('rest-nvim/rest.nvim')

	-- commenting
	use('folke/todo-comments.nvim')

	if packer_bootstrap then
		require('packer').sync()
	end
end)
