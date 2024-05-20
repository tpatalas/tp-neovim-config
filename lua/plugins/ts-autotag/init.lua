return {
	'windwp/nvim-ts-autotag',
	lazy = true,
	ft = {
		'html',
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
		'svelte',
		'vue',
		'tsx',
		'jsx',
		'rescript',
		'xml',
		'php',
		'markdown',
		'astro',
		'glimmer',
		'handlebars',
		'hbs',
	},
	-- Nvim Treesitter Setup is deprecated, use `require('nvim-ts-autotag').setup()` instead.

	config = function()
		require('nvim-ts-autotag').setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- per_filetype = {
			-- ['html'] = {
			-- 	enable_close = false,
			-- },
			-- },
		})
	end,
}
