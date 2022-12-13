-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  return
end

local typescript_setup, typescript = pcall(require, 'typescript')
if not typescript_setup then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap -- for conciseness

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
  keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts) -- see available code actions
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
  keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts) -- see outline on right hand side
  keymap.set('n', '<space>wa', '<cmd>add_workspace_folder<CR>', opts)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local function organize_imports()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = '',
  }
  vim.lsp.buf.execute_command(params)
end

-- Servers --
-- html
lspconfig['html'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- typescript
-- Currently typescript.nvim plugin gives better functionality
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
    commands = {
      OrganizeImports = {
        organize_imports,
        description = 'Organize Imports',
      },
    },
  },
})

-- docker
lspconfig['dockerls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- css
lspconfig['cssls'].setup({
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
})

-- css module
lspconfig['cssmodules_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- tailwind
lspconfig['tailwindcss'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- emmet
lspconfig['emmet_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
})

-- lua
lspconfig['sumneko_lua'].setup({
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
})
