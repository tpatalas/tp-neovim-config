local M = {}

------------
-- eslint --
------------

M.eslint = {
	condition = function(utils)
		return utils.root_has_file('.eslintrc.json')
	end,
}

--------------
-- prettier --
--------------
M.prettier = {
	condition = function(utils)
		local config_files = {
			'prettier.config.js',
			'prettier.config.json',
			'.prettierrc',
			'.prettierrc.js',
			'.prettierrc.json',
			'.prettierrc.toml',
			'.prettierrc.yml',
			'.prettierrc.yaml',
		}

		for _, filename in ipairs(config_files) do
			if utils.root_has_file(filename) then
				return true
			end
		end

		return false
	end,
}

------------
-- cspell --
------------
local cspell_custom_file_path = vim.fn.findfile('~/.config/langs/cspell.json')

local cspell_config_file_path = function()
	local custom_path = nil
	if cspell_custom_file_path ~= '' then
		custom_path = cspell_custom_file_path
	end
	return custom_path
end

local cspell_config_args = function()
	if cspell_config_file_path ~= nil then
		return cspell_custom_file_path
	else
		return nil
	end
end

M.cspell = {
	config = {
		create_config_file = true,
		find_json = cspell_config_file_path,
	},
	filetypes = {
		'markdown',
		'html',
		'yaml',
		'typescript',
		'typescriptreact',
		'lua',
		'luau',
		'graphql',
		'scss',
		'less',
		'jsonc',
		'handlebars',
		'markdown.mdx',
		'vue',
		'yaml',
		'json',
		'javascript',
		'javascriptreact',
		'css',
		'gitcommit',
	},
	extra_args = {
		'--config',
		cspell_config_args(),
		'--cache',
		'--gitignore',
		'--no-gitignore',
		'--locale',
		'en-US',
		'--language-id',
		'companies',
		'softwareTerms',
		'misc',
		'typescript',
		'node',
		'html',
		'python',
		'css',
		'bash',
		'fonts',
		'filetypes',
		'npm',
	},
}

return M
