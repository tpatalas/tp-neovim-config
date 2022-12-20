local autopairs_setup, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_setup then
	return
end

local remap = vim.api.nvim_set_keymap

autopairs.setup({ map_bs = false })

vim.g.coq_settings = { keymap = { recommended = false } }

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

_G.MUtils = {}

MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
			return autopairs.esc('<c-y>')
		else
			return autopairs.esc('<c-e>') .. autopairs.autopairs_cr()
		end
	else
		return autopairs.autopairs_cr()
	end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
		return autopairs.esc('<c-e>') .. autopairs.autopairs_bs()
	else
		return autopairs.autopairs_bs()
	end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
