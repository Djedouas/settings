function! myspacevim#before() abort
    set lines=50 columns=100

    " Explorateur à gauche
    let g:vimfiler_direction = 'topleft'
endfunction

" Change rendering logic to use ligature-compatible rendering scheme
function! s:GuiRenderLigatures(enable) abort
	call rpcnotify(0, 'Gui', 'Option', 'RenderLigatures', a:enable)
endfunction
command! -nargs=1 GuiRenderLigatures call s:GuiRenderLigatures(<args>)

function! myspacevim#after() abort
    let g:neomake_python_enabled_makers = ['pylint', 'mypy']
    let g:neoformat_enabled_python = ['black']
    let g:python_highlight_all = 1

    " Tagbar à droite
    let g:tagbar_left = 0

    " Recherches insensibles à la casse
    set ignorecase

    " w et b sont conscients de l'écriture camelCase, underscore, etc.
    call camelcasemotion#CreateMotionMappings('')

    " F11 pour plein écran
    nnoremap <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

    " pylint and mypy checking
    nnoremap <silent> <space>ea :Neomake pylint<CR>
    nnoremap <silent> <space>em :Neomake mypy<CR>
    nnoremap <silent> <space>ec :NeomakeClean<CR>

    " jedi
    nnoremap <silent> <space>lu :call jedi#usages()<CR>
    nnoremap <silent> <space>ln :call jedi#rename()<CR>

    " Add import statement from name under cursor
    nnoremap <F5> :ImportName<CR>

    " Ouvrir un explorateur dans le dossier du buffer
    nnoremap <F4> :VimFilerBufferDir<CR>

    " On empeche les commandes auto de pylint au save
    augroup neomake_automake
      autocmd!
    augroup END

    " Vimspector
    nmap <space>dl <Plug>VimspectorLaunch
    nmap <space>dc <Plug>VimspectorContinue
    nmap <space>dk <Plug>VimspectorStop
    nmap <space>dr <Plug>VimspectorRestart
    nmap <space>dp <Plug>VimspectorPause
    nmap <space>dd <Plug>VimspectorToggleBreakpoint
    nmap <S-F5> <Plug>VimspectorStepInto
    nmap <S-F6> <Plug>VimspectorStepOver
    nmap <S-F7> <Plug>VimspectorStepOut
    nmap <S-F8> <Plug>VimspectorContinue
    nmap <S-F9> <Plug>VimspectorBalloonEval
    nmap <silent> <S-F10> :VimspectorReset<CR>

    " Python templates
    nnoremap <silent> à o<CR><tab>def __init__(self, 
endfunction

