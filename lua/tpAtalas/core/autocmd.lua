-- comment out to disable the autocmd

-- set spell checks
-- vim.cmd([[autocmd BufRead,BufNewFile * setlocal spell spelllang=en spelloptions=camel spellsuggest=best,5]])
-- vim.cmd([[autocmd BufRead,BufNewFile * highlight SpellBad ctermfg=009 ctermbg=011 guifg=#e0def4 guibg=#403d52]])

-- conditional colorcolumn
vim.cmd([[autocmd BufRead,BufNewFile COMMIT_EDITMSG set colorcolumn=63,72,80]])

-- keymap based on filetype
vim.cmd([[autocmd FileType lua nnoremap <buffer><leader><CR><CR> :w<CR><cmd>lua ReloadConfig()<CR>]])

-- conditional textwidth and wrap text
vim.cmd([[autocmd FileType markdown set textwidth=80 wrap]])

-- auto-save
--
-- NOTE:
-- Write too often with autocmd will cause the high usage of CPU by TSC (typescript compiler) in null-ls. 
-- By default, TSC runs on workspace whenever the new buffer is open or saved (write). `silent write` 
-- every time TextChanged may cause performance issue
--
-- vim.cmd([[autocmd TextChanged,InsertLeave *.* silent write]])
vim.cmd([[autocmd BufLeave,BufWinLeave,BufWipeout,BufUnload,BufDelete *.* silent write]])

-- highlight the match under cursor
vim.cmd([[
  augroup AutoHighlight
    function! HighlightCurrentWord(event)
        set updatetime=500 " default updatetime=4000
        exe printf('match IncSearch /\V\<%s\>/', escape(expand(a:event), '/\'))
    endfunction    
    autocmd!
    autocmd CursorMovedI,CursorMoved * call HighlightCurrentWord('')
    autocmd CursorHoldI,CursorHold * if @% != 'NvimTree_1' | call HighlightCurrentWord('<cword>')
  augroup end
]])
