-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
    bold = true,
		colors = {
			'#ffb86c',
			'#8be9fd',
		  '#bd93f9',
			'#50fa7b',
			'#f1fa8c',
			'#abb2c0',
			'#ff5555',
		}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
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
