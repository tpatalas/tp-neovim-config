vim.cmd([[
  augroup TypeScriptAutocommands
    let g:is_tsc_running = 0

    function! DebounceTSCCommand()
      if g:is_tsc_running
        return
      endif

      if exists('g:debounce_timer')
        call timer_stop(g:debounce_timer)
      endif
      let g:debounce_timer = timer_start(2000, 'RunTSC')
    endfunction

    function! RunTSC(timer_id)
      let g:is_tsc_running = 1
      execute 'TSC'
      let g:is_tsc_running = 0
    endfunction

    autocmd!
    autocmd TextChanged,TextChangedI *.ts,*.tsx call DebounceTSCCommand()
  augroup END
]])
