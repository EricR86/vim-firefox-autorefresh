if exists("g:loaded_browserrefresh")
  finish
endif
let g:loaded_browserrefresh = 1
let g:firefox_refresh_files = '*.html,*.htm,*.php,*.py,*.css,*.js'

let s:browserRefreshOn = 0

let s:commandToExecute = 'browser_refresh.py'
" Need to check if I can find the python file
" check the user's path first. if not found then search relative to
" browser_refresh .vim in the runtimepath.
if !executable(s:commandToExecute)
    let paths = substitute(escape(&runtimepath, ' '), '\(,\|$\)', '/**\1', 'g')
    let s:commandToExecute = findfile('browser_refresh.py', paths)

    if !filereadable(s:commandToExecute)
        echohl WarningMsg
        echom 'Warning: could not find browser_refresh.py on your path or in your vim runtime path.'
        echohl None
        finish
    endif
endif

" if has('win32') || has('win64')
"     let s:commandToExecute = 'python ' . s:commandToExecute
" endif

function! s:StartBrowserRefresh()
    let s:browserRefreshOn = 1
endfunction

function! s:StopBrowserRefresh()
    let s:browserRefreshOn = 0
endfunction

function! s:RefreshBrowser()
    if s:browserRefreshOn
        "silent exec '!' . s:commandToExecute
        "echo s:commandToExecute
        " This won't open a command window of any kind
        silent exec 'pyfile' . s:commandToExecute
    endif
endfunction

" Commands
command StartFFRefresh :call s:StartBrowserRefresh()
command StopFFRefresh :call s:StopBrowserRefresh()

exec 'autocmd BufWritePost ' + g:firefox_refresh_files + ' :call s:RefreshBrowser()':l
