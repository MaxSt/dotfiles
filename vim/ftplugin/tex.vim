setlocal textwidth=130
setlocal formatoptions=l

autocmd CursorMovedI *.tex call FormatLatex()
autocmd TextChanged *.tex call FormatLatex()


function FormatLatex()
  let line = getline('.')
  let dontformat = '\v(^\s*\\)|(^(\s*)$)'
  if line !~ dontformat
    let _cursorcol = col('.')
    if strlen(line)+1 == _cursorcol
      let append = 1
    else
      let append = 0
    endif

    normal ml

    "Start and End of Format Selection
    let startformat = search(dontformat, 'bW')
    let endformat = search(dontformat, 'W')

    if endformat == 0
      execute "normal 'lV".(startformat+1)."GoGgq'l"
    else
      execute "normal 'lV".(startformat+1)."Go".(endformat-1)."Ggq'l"
    endif


    if append
      let new_cursor = getpos('.')
      let new_cursor[2] = new_cursor[2] + 1
      call setpos('.', new_cursor)
  endif

  endif
endfunction

