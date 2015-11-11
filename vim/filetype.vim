augroup filetypedetect
au BufNewFile,BufRead *.js.erb set filetype=javascript.eruby
au BufNewFile,BufRead eslintrc set filetype=javascript
au BufNewFile,BufRead *.less set filetype=less.css
au BufNewFile,BufRead .vimperatorrc set filetype=vim
au BufNewFile,BufRead *.pandoc set filetype=pandoc
au BufNewFile,BufRead *.tex set filetype=tex
au BufNewFile,BufRead config set filetype=config
au BufNewFile,BufRead *.jbuilder set filetype=ruby
augroup end
