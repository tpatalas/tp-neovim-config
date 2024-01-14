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
	config = function()
		require('nvim-ts-autotag').setup()
	end,
}
