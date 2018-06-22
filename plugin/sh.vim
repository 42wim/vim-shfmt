function! Autoformat()
    if get(g:, "sh_fmt_autosave", 1)
        autocmd BufWritePre * call shfmt#Format()
    endif
endfunction

autocmd FileType sh call Autoformat()

command! -nargs=0 Shfmt call shfmt#Format()

" vim:ts=4:sw=4:et
