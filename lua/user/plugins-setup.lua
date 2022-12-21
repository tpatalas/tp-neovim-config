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
	-- plugin manager
	use('wbthomason/packer.nvim') -- packer can manage itself
	use('nvim-lua/plenary.nvim') -- lua functions that many plugins use

	-- colors
	use('EdenEast/nightfox.nvim') -- colorscheme
	use('norcalli/nvim-colorizer.lua') -- colorizer

	-- essential plugins
	use('tpope/vim-surround') -- add, delete, change surroundings (it's awesome)
	use('vim-scripts/ReplaceWithRegister') -- replace with register contents using motion (gr + motion)

	-- commenting
	use('numToStr/Comment.nvim')
	use('folke/todo-comments.nvim')
	use('JoosepAlviste/nvim-ts-context-commentstring')

	-- statusline
	use('nvim-lualine/lualine.nvim')

	-- search and finder
	use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }) -- dependency for better sorting performance
	use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' }) -- fuzzy finder
	-- makesure to install `$ brew install ripgrep` to use livegrep
	-- navigation
	use({
		'andymass/vim-matchup',
		setup = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = 'popup' }
		end,
	})

	-- file explorer
	use('nvim-tree/nvim-tree.lua')

	-- vscode like icon
	use('nvim-tree/nvim-web-devicons')

	-- autocompletion & snippets
	use({ 'ms-jpq/coq_nvim', branch = 'coq' })
	use({ 'ms-jpq/coq.artifacts', branch = 'artifacts' })
	use({ 'ms-jpq/coq.thirdparty', branch = '3p' })

	-- managing & installing lsp servers, linters & formatters
	use('williamboman/mason.nvim') -- in charge of managing lsp servers, linters & formatters
	use('williamboman/mason-lspconfig.nvim') -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use('neovim/nvim-lspconfig') -- easily configure language servers
	use({ 'glepnir/lspsaga.nvim', branch = 'main' }) -- enhanced lsp uis
	use('jose-elias-alvarez/typescript.nvim') -- additional functionality for typescript server (e.g. rename file & update imports)

	-- formatting & linting
	use('jose-elias-alvarez/null-ls.nvim') -- configure formatters & linters
	use('jayp0521/mason-null-ls.nvim') -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use('nvim-treesitter/nvim-treesitter', { 'do', ':TSUpdate' })

	-- auto closing
	use('windwp/nvim-autopairs') -- autoclose parens, brackets, quotes, etc...
	use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }) -- autoclose tags

	-- git integration
	use('lewis6991/gitsigns.nvim') -- show line modifications on left hand side

	-- toggle multiple terminal -- can also control the lazyGit (installed through homebrew)
	use({ 'akinsho/toggleterm.nvim', tag = '*' })

	-- markdown
	use({
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		setup = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		ft = { 'markdown' },
	}) -- markdown preview
	use('dhruvasagar/vim-table-mode') -- markdown table
	use('mzlogin/vim-markdown-toc') -- toc generator

	if packer_bootstrap then
		require('packer').sync()
	end
end)
