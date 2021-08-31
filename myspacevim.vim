function! myspacevim#before() abort
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
    let g:pydocstring_doq_path = '~/.local/bin/doq'
    let g:pydocstring_formatter = 'numpy'

    " Raccourci pour ouvrir un buffer dans un tab
    nnoremap <silent> <space>m :tabedit %<CR>

    " Tagbar à droite
    let g:tagbar_left = 0

    " Recherches insensibles à la casse
    set ignorecase

    " w et b sont conscients de l'écriture camelCase, underscore, etc.
    call camelcasemotion#CreateMotionMappings('')

    " On active les ligatures
    call s:GuiRenderLigatures(1)

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

    " Fermer le python runner
    nmap ù <space>wjq<space>2


    " On empeche les commandes auto de pylint au save
    augroup neomake_automake
      autocmd!
    augroup END

    " Zeavim
    nmap gz <Plug>Zeavim
    nmap gZ <Plug>ZVOperator
    let g:zv_file_types = {'py': 'python,qt,qgis'}

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
    nnoremap <space>dw :VimspectorWatch 
    nnoremap <space>de :VimspectorEval 

    " Python templates
    nnoremap <silent> à odef __init__(self, 

endfunction

