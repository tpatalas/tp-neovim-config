-----------------------------
-- conditional colorcolumn --
-----------------------------
vim.cmd([[autocmd BufRead,BufNewFile COMMIT_EDITMSG set colorcolumn=63,72,80]])

------------------------------
-- keymap based on filetype --
------------------------------
vim.cmd([[autocmd FileType lua nnoremap <buffer><leader><CR><CR> :w<CR><cmd>lua ReloadConfig()<CR>]])

-----------------------------------------
-- conditional textwidth and wrap text --
-----------------------------------------
vim.cmd([[autocmd FileType markdown set colorcolumn=80,90]])
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
    autocmd CursorHold *.* if @% != 'wezterm.lua' | silent! write
  augroup end
]])

-----------------------------------
-- remove all trailing whitespce --
-----------------------------------
vim.cmd([[autocmd FileType lua :%s/\s\+$//e]])

