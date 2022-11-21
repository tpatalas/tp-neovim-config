-- comment out to disable the autocmd

-- set spell checks
-- vim.cmd([[autocmd BufRead,BufNewFile * setlocal spell spelllang=en spelloptions=camel spellsuggest=best,5]])
-- vim.cmd([[autocmd BufRead,BufNewFile * highlight SpellBad ctermfg=009 ctermbg=011 guifg=#e0def4 guibg=#403d52]])

-- conditional colorcolumn
vim.cmd([[autocmd BufRead,BufNewFile COMMIT_EDITMSG set colorcolumn=63,72,80]])

-- conditional textwidth and wrap text
-- vim.cmd([[autocmd FileType markdown set ]])
vim.cmd([[autocmd FileType markdown set textwidth=80 wrap]])
