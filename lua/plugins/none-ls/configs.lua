local M = {}

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


return M
