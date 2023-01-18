return {

	'nvim-treesitter/nvim-treesitter',
	build = function()
		pcall(require('nvim-treesitter.install').update({ with_sync = true }))
	end,
	dependencies = {
		'windwp/nvim-ts-autotag', --autotag
	},

	config = function()
		require('nvim-treesitter.configs').setup({
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
				config = {
					javascript = {
						__default = '// %s',
						jsx_element = '{/* %s */}',
						jsx_fragment = '{/* %s */}',
						jsx_attribute = '// %s',
						comment = '// %s',
					},
					typescript = { __default = '// %s', __multiline = '/* %s */' },
				},
			},
			-- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				'json',
				'javascript',
				'typescript',
				'tsx',
				'yaml',
				'http',
				'html',
				'css',
				'markdown',
				'svelte',
				'graphql',
				'bash',
				'lua',
				'vim',
				'dockerfile',
				'gitignore',
			},
			-- auto install above language parsers
			auto_install = true,
		})
	end,
}
