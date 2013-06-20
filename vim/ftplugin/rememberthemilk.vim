"Calendar Function
function! MyCalAction(day,month,year,week,dir)
  " day   : day you actioned
  " month : month you actioned
  " year  : year you actioned
  " week  : day of week (Mo=1 ... Su=7)
  " dir   : direction of calendar
  :echo "inserting Date"
  exe "normal q\<C-j>a\<CR> ^" . a:year . "." . a:month . "." . a:day . " "
endfunction
let calendar_action = 'MyCalAction'

imap <C-d> <Esc>:Calendar<CR>
