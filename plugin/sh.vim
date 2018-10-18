let g:shfmt_autofmt_enabled=0
function! Autoformat()
    if g:shfmt_autofmt_enabled==0 && get(g:, "sh_fmt_autosave", 1)
        autocmd BufWritePre * call shfmt#Format()
        let g:shfmt_autofmt_enabled=1
    endif
endfunction

autocmd FileType sh call Autoformat()

command! -nargs=0 Shfmt call shfmt#Format()

" vim:ts=4:sw=4:et
