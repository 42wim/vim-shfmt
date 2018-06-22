" fmt.vim: Vim command to format sh files with shfmt.

if !exists('g:sh_fmt_fail_silently')
    let g:sh_fmt_fail_silently = 1
endif

if !exists('g:sh_fmt_options')
    let g:sh_fmt_options = ''
endif

" Below function is copied from vim-go's fmt.vim file.
function! shfmt#Format()
    if !executable("shfmt")
        echo "shfmt: could not find shfmt. Please install it from github.com/mvdan/sh"
        return ""
    endif

    " save cursor position and many other things
    let l:curw=winsaveview()

    " Write current unsaved buffer to a temp file
    let l:tmpname = tempname()
    let a:source = l:tmpname
    let a:target = expand('%')
    call writefile(getline(1, '$'), l:tmpname)

    let fmt_command = "shfmt"

    " populate the final command with user based fmt options
    let command = fmt_command . ' -w ' . g:sh_fmt_options

    " execute our command...
    let out = system(command . " " . l:tmpname)

    "if there is no error on the temp file replace the output with the current
    "file (if this fails, we can always check the outputs first line with:
    "splitted =~ 'package \w\+')
    if v:shell_error == 0
        " remove undo point caused via BufWritePre
        try | silent undojoin | catch | endtry

        " Replace current file with temp file, then reload buffer
        if exists("*getfperm")
            " save file permissions
            let original_fperm = getfperm(a:target)
        endif

        call rename(a:source, a:target)

        "let perms = getfperm(expand('%'))
        " call setfperm(expand('%'),perms)
        " restore file permissions
        if exists("*setfperm") && original_fperm != ''
            call setfperm(a:target , original_fperm)
        endif
        silent edit!
        let &syntax = &syntax
    elseif g:sh_fmt_fail_silently == 0
        echo out
        " We didn't use the temp file, so clean up
        call delete(l:tmpname)
    endif

    " restore our cursor/windows positions
    call winrestview(l:curw)
endfunction


" vim:ts=4:sw=4:et
