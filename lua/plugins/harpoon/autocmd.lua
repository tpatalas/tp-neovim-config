----------------------------------
-- Add Harpoon before leave vim --
----------------------------------
vim.cmd([[
  let s:excluded_filetypes = ['oil', 'gitcommit']
  let s:excluded_filenames = ['wezterm.lua']

  augroup AutoAddHarpoon
    function! AddToHarpoon()
      for filetype in s:excluded_filetypes
        if &filetype == filetype
          return
        endif
      endfor

      let filename = expand('%:t') 
      for excluded_filename in s:excluded_filenames
        if filename == excluded_filename
          return
        endif
      endfor

      lua require('harpoon.mark').add_file()
    endfunction
    autocmd!
    autocmd VimLeave * call AddToHarpoon()
  augroup end
]])
