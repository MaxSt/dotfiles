autocmd BufWritePost,FileWritePost *.pandoc silent !pandoc -s % -o %:r.pdf
