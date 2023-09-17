local M = {}

local cmp_nvim_lsp = require('cmp_nvim_lsp')

local on_attach = function(client, bufnr) end
local capabilities = cmp_nvim_lsp.default_capabilities()
local default_configs = {
	capabilities = capabilities,
	on_attach = on_attach,
}

M.html = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		separate_diagnostic_server = true,
		publish_diagnostic_on = 'insert_leave',
	},
}

M.tsserver = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		separate_diagnostic_server = true,
		publish_diagnostic_on = 'change',
		tsserver_max_memory = 'auto',
	},
	handlers = {
		['textDocument/publishDiagnostics'] = function(_, result, ctx, ...)
			local client = vim.lsp.get_client_by_id(ctx.client_id)

			if client and client.name == 'tsserver' then
				result.diagnostics = vim.tbl_filter(function(diagnostic)
					return diagnostic.code ~= 80001
				end, result.diagnostics)
			end

			return vim.lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, ...)
		end,
	},
}

M.dockerls = default_configs
M.jsonls = default_configs
M.cssmodules_ls = default_configs

M.cssls = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		scss = {
			lint = {
				unknownAtRules = 'ignore',
			},
		},
		css = {
			lint = {
				unknownAtRules = 'ignore',
			},
		},
		less = {
			lint = {
				unknownAtRules = 'ignore',
			},
		},
	},
}

M.tailwindcss = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					-- https://cva.style/docs/getting-started/installation
					{ 'cva\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
				},
			},
		},
	},
	filetypes = {
		'html',
		'typescriptreact',
		'typescript',
		'javascriptreact',
		'javascript',
		'css',
		'sass',
		'scss',
		'less',
		'svelte',
	},
}

M.emmet_ls = {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
}

M.lua_ls = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
			},
		},
	},
}

return M
