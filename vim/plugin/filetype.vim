" Markdown
if exists("did_load_filetypes")
    finish
endif
augroup markdown
    au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END

" Alloy 
au BufRead,BufNewFile *.als setfiletype alloy3
