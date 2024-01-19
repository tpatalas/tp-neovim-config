-- reset cursor

vim.api.nvim_create_autocmd('VimLeave', { command = 'set guicursor=a:ver25' })
