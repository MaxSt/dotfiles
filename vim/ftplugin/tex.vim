setlocal textwidth=130
setlocal formatoptions=l
setlocal spell

autocmd TextChangedI *.tex call FormatLatex()
autocmd TextChanged *.tex call FormatLatex()

call textobj#user#plugin('formattext', {
\   'code': {
\     'select-i': 'it',
\     'select-i-function': 'FormatText'
\   },
\ })

function! FormatText()
    "%u0025 = %
    let dontformat = '((^\s*\\.*$)|(^\s*$)|(^\s*%u0025))'
    let format = '((^\s*\\ref\{.*$)|(^\s*\\\".*$))'
    let ignoreformat = '\v'.dontformat.'&'.format.'@!'
    call search(ignoreformat, 'bce')
    let start_position = [0, line('.') + 1, 1, 0]
    call search(ignoreformat, '')
    let end_position = [0, line('.') - 1, 99999, 0]
    return ['v', start_position, end_position]
endfunction


function! FormatLatex()
  let dontformat = '((^\s*\\.*$)|(^\s*$)|(^\s*%u0025))'
  let format = '((^\s*\\ref\{.*$)|(^\s*\\\".*$))'
  let ignoreformat = '\v'.dontformat.'&'.format.'@!'
  let ignoreformat = '\v'.dontformat.'&'.format.'@!'
  let line = getline('.')
  if line !~ ignoreformat
    normal gwit
  end
endfunction

