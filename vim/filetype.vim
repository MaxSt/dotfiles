augroup filetypedetect
au BufNewFile,BufRead *.html.erb set filetype=eruby.html.javascript
au BufNewFile,BufRead *.js.erb set filetype=javascript.eruby
au BufNewFile,BufRead *.less set filetype=less.css
augroup end
