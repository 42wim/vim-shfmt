if get(g:, "sh_fmt_autosave", 1)
    autocmd BufWritePre *.sh call shfmt#Format()
endif

command! -nargs=0 Shfmt call shfmt#Format()


" vim:ts=4:sw=4:et
