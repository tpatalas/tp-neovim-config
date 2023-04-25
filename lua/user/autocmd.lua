-----------------------------------------
-- conditional textwidth and wrap text --
-----------------------------------------
vim.cmd([[
  augroup MarkdownWrap
    autocmd!
    " autocmd BufRead,BufNewFile * if &filetype != 'markdown' && &filetype != 'gitcommit' | set textwidth=0 nowrap colorcolumn=80 | endif
    autocmd FileType markdown set textwidth=80 wrap colorcolumn=80,90
    autocmd FileType gitcommit set colorcolumn=63,80
  augroup end
]])

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
    autocmd CursorHold * if @% !~ 'neo-tree*' | call HighlightCurrentWord('<cword>')
  augroup end
]])

---------------
-- auto save --
---------------
vim.cmd(
	[[autocmd TextChanged,InsertLeave *.* if &filetype != 'gitcommit' || @% != 'wezterm.lua' | silent! write | endif]]
)

-----------------------------------
-- remove all trailing whitespce --
-----------------------------------
vim.cmd([[autocmd FileType lua :%s/\s\+$//e]])

----------------------------------------------
-- auto close quickFix after selecting item --
----------------------------------------------
vim.cmd([[autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>]])

------------------------
-- auto cursor shape --
-----------------------
vim.cmd([[
  augroup BlinkCursor
    autocmd!
    autocmd VimEnter * set guicursor=n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
  augroup end
]])

----------------------------------
-- clear search when unload Buf --
----------------------------------
vim.cmd([[autocmd BufUnload * :let @/ = ""]])
