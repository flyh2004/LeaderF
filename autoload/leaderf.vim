" ============================================================================
" File:        leaderf.vim
" Description:
" Author:      Yggdroot <archofortune@gmail.com>
" Website:     https://github.com/Yggdroot
" Note:
" License:     This script is released under the Vim License.
" ============================================================================

exec g:Lf_py "import vim, sys"
exec g:Lf_py "cwd = vim.eval('expand(\"<sfile>:p:h\")')"
exec g:Lf_py "sys.path.insert(0, cwd)"

function! s:ImportOnce(var, cmd)
    if g:Lf_PythonVersion == 2 && pyeval("sys.version_info < (2, 7)")
        echohl Error
        echo "Error: LeaderF requires python2.7+, your current version is " . pyeval("sys.version")
        echohl None
        return 0
    elseif g:Lf_PythonVersion == 3 && py3eval("sys.version_info < (3, 1)")
        echohl Error
        echo "Error: LeaderF requires python3.1+, your current version is " . pyeval("sys.version")
        echohl None
        return 0
    endif
    if !exists(a:var)
        exec 'let '.a:var.'= 1'
        exec g:Lf_py a:cmd
    endif
    return 1
endfunction

function! leaderf#fileExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "fileExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "fileExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "fileExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "fileExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "fileExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "fileExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "fileExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "fileExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "fileExplManager.toggleHelp()"<CR>
    nnoremap <buffer> <silent> <F5>          :exec g:Lf_py "fileExplManager.refresh()"<CR>
    nnoremap <buffer> <silent> s             :exec g:Lf_py "fileExplManager.addSelections()"<CR>
    nnoremap <buffer> <silent> a             :exec g:Lf_py "fileExplManager.selectAll()"<CR>
    nnoremap <buffer> <silent> c             :exec g:Lf_py "fileExplManager.clearSelections()"<CR>
endfunction

function! leaderf#bufExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "bufExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "bufExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "bufExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "bufExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "bufExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "bufExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "bufExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "bufExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "bufExplManager.toggleHelp()"<CR>
    nnoremap <buffer> <silent> d             :exec g:Lf_py "bufExplManager.deleteBuffer(1)"<CR>
    nnoremap <buffer> <silent> D             :exec g:Lf_py "bufExplManager.deleteBuffer()"<CR>
endfunction

function! leaderf#mruExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "mruExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "mruExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "mruExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "mruExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "mruExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "mruExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "mruExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "mruExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "mruExplManager.toggleHelp()"<CR>
    nnoremap <buffer> <silent> d             :exec g:Lf_py "mruExplManager.deleteMru()"<CR>
    nnoremap <buffer> <silent> s             :exec g:Lf_py "mruExplManager.addSelections()"<CR>
    nnoremap <buffer> <silent> a             :exec g:Lf_py "mruExplManager.selectAll()"<CR>
    nnoremap <buffer> <silent> c             :exec g:Lf_py "mruExplManager.clearSelections()"<CR>
endfunction

function! leaderf#tagExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "tagExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "tagExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "tagExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "tagExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "tagExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "tagExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "tagExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "tagExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "tagExplManager.toggleHelp()"<CR>
    nnoremap <buffer> <silent> <F5>          :exec g:Lf_py "tagExplManager.refresh()"<CR>
endfunction

function! leaderf#bufTagExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "bufTagExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "bufTagExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "bufTagExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "bufTagExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "bufTagExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "bufTagExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "bufTagExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "bufTagExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "bufTagExplManager.toggleHelp()"<CR>
    nnoremap <buffer> <silent> j             j:exec g:Lf_py "bufTagExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> k             k:exec g:Lf_py "bufTagExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> <Up>          <Up>:exec g:Lf_py "bufTagExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> <Down>        <Down>:exec g:Lf_py "bufTagExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> <LeftMouse>   <LeftMouse>:exec g:Lf_py "bufTagExplManager._previewResult()"<CR>
endfunction

function! leaderf#functionExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "functionExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "functionExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "functionExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "functionExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "functionExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "functionExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "functionExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "functionExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "functionExplManager.toggleHelp()"<CR>
    nnoremap <buffer> <silent> j             j:exec g:Lf_py "functionExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> k             k:exec g:Lf_py "functionExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> <Up>          <Up>:exec g:Lf_py "functionExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> <Down>        <Down>:exec g:Lf_py "functionExplManager._previewResult()"<CR>
    nnoremap <buffer> <silent> <LeftMouse>   <LeftMouse>:exec g:Lf_py "functionExplManager._previewResult()"<CR>
endfunction

function! leaderf#lineExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "lineExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "lineExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "lineExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "lineExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "lineExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "lineExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "lineExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "lineExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "lineExplManager.toggleHelp()"<CR>
endfunction

function! leaderf#historyExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "historyExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "historyExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "historyExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "historyExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "historyExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "historyExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "historyExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "historyExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "historyExplManager.toggleHelp()"<CR>
endfunction

function! leaderf#selfExplMaps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "selfExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "selfExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "selfExplManager.accept()"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "selfExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "selfExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "selfExplManager.toggleHelp()"<CR>
endfunction

function! leaderf#LfPy(cmd)
    exec g:Lf_py . a:cmd
endfunction

function! leaderf#startFileExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_fileExpl_loaded", "from leaderf.fileExpl import *") == 0
        return
    endif
    if a:0 == 0
        call leaderf#LfPy("fileExplManager.startExplorer('".a:win_pos."')")
    else
        let dir = fnamemodify(a:1.'/',":h:gs?\\?/?")
        call leaderf#LfPy("fileExplManager.startExplorer('".a:win_pos."','".dir."')")
    endif
endfunction

function! leaderf#startBufExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_bufExpl_loaded", "from leaderf.bufExpl import *") == 0
        return
    endif
    if a:0 == 0
        call leaderf#LfPy("bufExplManager.startExplorer('".a:win_pos."')")
    else
        let arg = a:1 == 0 ? 'False' : 'True'
        call leaderf#LfPy("bufExplManager.startExplorer('".a:win_pos."',".arg.")")
    endif
endfunction

function! leaderf#startMruExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_mruExpl_loaded", "from leaderf.mruExpl import *") == 0
        return
    endif
    if a:0 == 0
        call leaderf#LfPy("mruExplManager.startExplorer('".a:win_pos."',"."vim.current.buffer.name)")
    else
        call leaderf#LfPy("mruExplManager.startExplorer('".a:win_pos."',"."vim.current.buffer.name, f='cwd')")
    endif
endfunction

function! leaderf#startTagExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_tagExpl_loaded", "from leaderf.tagExpl import *") == 0
        return
    endif
    call leaderf#LfPy("tagExplManager.startExplorer('".a:win_pos."')")
endfunction

function! leaderf#removeCache(bufNum)
    if exists("s:Lf_bufTagExpl_loaded")
        call leaderf#LfPy("bufTagExplManager.removeCache(".a:bufNum.")")
    endif
    if exists("s:Lf_functionExpl_loaded")
        call leaderf#LfPy("functionExplManager.removeCache(".a:bufNum.")")
    endif
endfunction

function! leaderf#startBufTagExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_bufTagExpl_loaded", "from leaderf.bufTagExpl import *") == 0
        return
    endif
    if a:0 == 0
        call leaderf#LfPy("bufTagExplManager.startExplorer('".a:win_pos."')")
    else
        call leaderf#LfPy("bufTagExplManager.startExplorer('".a:win_pos."',"."1)")
    endif
endfunction

function! leaderf#startFunctionExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_functionExpl_loaded", "from leaderf.functionExpl import *") == 0
        return
    endif
    if a:0 == 0
        call leaderf#LfPy("functionExplManager.startExplorer('".a:win_pos."')")
    else
        call leaderf#LfPy("functionExplManager.startExplorer('".a:win_pos."',"."1)")
    endif
endfunction

function! leaderf#startLineExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_lineExpl_loaded", "from leaderf.lineExpl import *") == 0
        return
    endif
    if a:0 == 0
        call leaderf#LfPy("lineExplManager.startExplorer('".a:win_pos."')")
    else
        call leaderf#LfPy("lineExplManager.startExplorer('".a:win_pos."',"."1)")
    endif
endfunction

function! leaderf#startHistoryExpl(win_pos, type)
    if s:ImportOnce("s:Lf_historyExpl_loaded", "from leaderf.historyExpl import *") == 0
        return
    endif
    call leaderf#LfPy("historyExplManager.startExplorer('".a:win_pos."', '".a:type."')")
endfunction

function! leaderf#startSelfExpl(win_pos, ...)
    if s:ImportOnce("s:Lf_selfExpl_loaded", "from leaderf.selfExpl import *") == 0
        return
    endif
    call leaderf#LfPy("selfExplManager.startExplorer('".a:win_pos."')")
endfunction
