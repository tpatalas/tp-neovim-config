-- Resource:
-- https://stackoverflow.com/questions/72412720/how-to-source-init-lua-without-restarting-neovimg

function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match('^tpAtalas') and not name:match('nvim-tree') then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	vim.notify('configuration reloaded!', vim.log.levels.INFO)
end
