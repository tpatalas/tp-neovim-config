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

---------------------------------------------------
-- highlight and autosave the match under cursor --
---------------------------------------------------
vim.cmd([[
  augroup AutoHighlight
    function! HighlightCurrentWord(event)
        exe printf('match IncSearch /\V\<%s\>/', escape(expand(a:event), '/\'))
    endfunction    
    autocmd!
    autocmd CursorMovedI,CursorMoved * call HighlightCurrentWord('')
    autocmd CursorHold * if @% != 'NvimTree_1' | call HighlightCurrentWord('<cword>')
    autocmd CursorHold *.* silent! write
  augroup end
]])

-------------------------------------
-- cmp custom delay autocompletion --
-------------------------------------
vim.cmd([[
  augroup DelayAutoCompletionCmp
    let s:timer = 0
    function! s:on_text_changed() abort
      call timer_stop(s:timer)
      let s:timer = timer_start(500, function('s:complete'))
    endfunction
    function! s:complete(...) abort
      lua require('cmp').complete({ reason = require('cmp').ContextReason.Auto })
    endfunction
    autocmd!
    autocmd TextChangedI * call s:on_text_changed()
  augroup end
]])
