function! myspacevim#before() abort
    " use special font for powerline (nerd-fonts)
    let g:vimtweak_focus_transparency_gained_value = 7

    " DBEXT {
        let g:dbext_default_display_cmd_line = 0
        let g:dbext_default_buffer_lines=15
        let g:dbext_default_profile_impala = 'type=ODBC:dsnname=impaladsn32'
        let g:dbext_default_profile = 'impala'
        let g:dbext_default_DBI_dict_proc_ODBC = ''
        let g:dbext_default_DBI_list_proc_ODBC = ''
        let g:dbext_default_DBI_desc_proc_ODBC = ''
        let g:dbext_default_menu_mode = '0'
        "exec 'DBCompleteTables!'
        "exec 'DBCompleteProcedures!'
        "exec 'DBCompleteViews!'
    " }

    " stop bugging me with line length in python
    let g:neomake_python_pep8_maker = {
        \ 'args': ['--ignore=E501,E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default', '--max-line-length=1200'],
        \ 'errorformat':
            \ '%E%f:%l: could not compile,%-Z%p^,' .
            \ '%A%f:%l:%c: %t%n %m,' .
            \ '%A%f:%l: %t%n %m,' .
            \ '%-G%.%#',
        \ }

    " use pep8 as a linter for python because it seems to be abundantly available
    " with any distro of anaconda. disable warnings such as long lines and short names
    let g:neomake_python_pylint_args = ['--ignore=E501,E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default', '--max-line-length=1200']
    let g:neomake_python_enabled_makers = ['pep8']

    " still working on highlighting trailing whitespace
    let g:better_whitespace_enabled = 1
    let g:spacevim_buffer_index_type = 3
endfunction

function! myspacevim#after() abort
    " best old-school natural mouse behavior with gvim
    set mouse=a

    " set no relative numbering
    set nornu

    " remove audio and visual error bells and scroll bar
    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=
    set guioptions-=r
    set clipboard=unnamed

    " colorscheme
    " let g:spacevim_colorscheme = 'base16-atelier-lakeside'
    " let g:spacevim_colorscheme = 'base16-icy'
    let g:spacevim_colorscheme = 'base16-irblack'

    " stop bugging me with line length in python
    let g:neomake_python_pep8_maker = {
        \ 'args': ['--ignore=E501,E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default', '--max-line-length=1200'],
        \ 'errorformat':
            \ '%E%f:%l: could not compile,%-Z%p^,' .
            \ '%A%f:%l:%c: %t%n %m,' .
            \ '%A%f:%l: %t%n %m,' .
            \ '%-G%.%#',
        \ }

    " use pep8 as a linter for python because it seems to be abundantly available
    " with any distro of anaconda. disable warnings such as long lines and short names
    let g:neomake_python_pylint_args = ['--ignore=E501,E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default', '--max-line-length=1200']
    let g:neomake_python_enabled_makers = ['pep8']
    
    " the following combined with vimtweak enables semi transparent gvim
    " ensure vimtweak32 and vimtweak64 dlls are loaded in c:\program files (x86)\vim\<version> dir
    " also ensure PATH points to that same dir as well
    if &cp || (exists('g:loaded_transparency_windows_vim') && g:loaded_transparency_windows_vim)
      finish
    endif

    let g:loaded_transparency_windows_vim = 1

    if !has('gui_running') || (!has('win32') && !has('win64'))
      finish
    endif

    let s:dll = get(g:, 'vimtweak_dll_path', '')
    if empty(s:dll)
      let s:dll = get(split(globpath(&rtp, has('win64') ? 'vimtweak64.dll' : 'vimtweak32.dll'), '\n'), 0, '')
      if empty(s:dll)
        finish
      endif
    endif

    function! s:Transparency(v)
      call libcallnr(s:dll, 'SetAlpha', 255-a:v) 
    endfunction

    function! s:Install(flag)
      augroup TransparencyWindows
        autocmd!
        if a:flag =~# '^\(1\|[tT]rue\|[yY]es\)$'
          autocmd FocusGained * call s:Transparency(g:vimtweak_focus_transparency_gained_value)
          autocmd FocusLost * call s:Transparency(50)
        endif
      augroup END
    endfunction

    command! -nargs=1 Transparency call <SID>Install(<f-args>)

    Transparency Yes
endfunction

"function! s:Transparency(v)
"    let s:dll = get( "c:/vimtweak.dll")
"    call libcallnr(s:dll, 'SetAlpha', 255-a:v) 
"endfunction
"
"function! s:Install(flag)
"    augroup TransparencyWindows
"        autocmd!
"        if a:flag =~# '^\(1\|[tT]rue\|[yY]es\)$'
"            autocmd FocusGained * call s:Transparency(g:vimtweak_focus_transparency_gained_value)
"            autocmd FocusLost * call s:Transparency(50)
"        endif
"    augroup END
"endfunction

