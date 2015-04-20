augroup filetypedetect
au BufNewFile,BufRead *.html.erb set filetype=eruby.html.javascript
au BufNewFile,BufRead *.js.erb set filetype=javascript.eruby
au BufNewFile,BufRead *.less set filetype=less.css
au BufNewFile,BufRead .vimperatorrc set filetype=vim
au BufNewFile,BufRead *.pandoc set filetype=pandoc
au BufNewFile,BufRead *.tex set filetype=tex
au BufNewFile,BufRead config set filetype=config
au BufNewFile,BufRead *.react.js set filetype=javascript.jsx
augroup end
