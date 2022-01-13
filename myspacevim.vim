function! myspacevim#before() abort
    " Explorateur à gauche
    let g:vimfiler_direction = 'topleft'

    " Taille des sidebars (explorateur et outline)
    let g:spacevim_sidebar_width = 40
endfunction

" Change rendering logic to use ligature-compatible rendering scheme
function! s:GuiRenderLigatures(enable) abort
	call rpcnotify(0, 'Gui', 'Option', 'RenderLigatures', a:enable)
endfunction
command! -nargs=1 GuiRenderLigatures call s:GuiRenderLigatures(<args>)

function! myspacevim#after() abort
    let g:neomake_python_enabled_makers = ['pylint', 'mypy', 'pytest', 'flake8']
    let g:neoformat_enabled_python = ['black']
    let g:python_highlight_all = 1
    let g:pydocstring_doq_path = '~/.local/bin/doq'
    let g:pydocstring_formatter = 'sphinx'

    " Raccourci pour ouvrir un buffer dans un tab
    nnoremap <silent> <space>M :tabedit %<CR>

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
    nnoremap <silent> <space>ef :Neomake flake8<CR>
    nnoremap <silent> <space>em :Neomake mypy<CR>
    nnoremap <silent> <space>ec :NeomakeClean<CR>

    " jedi
    let g:jedi#smart_auto_mappings = 1
    nnoremap <silent> <space>lu :call jedi#usages()<CR>
    nnoremap <silent> <space>ln :call jedi#rename()<CR>
    nnoremap <silent> <space>gd :call jedi#goto_definitions()<CR>

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
    let g:zv_file_types = {'py': 'python,qt,qgis', 'cpp': 'cpp,qt,qgis'}

    " Python templates
    nnoremap <silent> à odef __init__(self, 

    " Indentation 3 spaces for rest files
    au FileType rst setlocal shiftwidth=3 tabstop=3

    " Descendre, relancer la derniere commande du terminal et remonter
    nmap <space>o <C-Down><Up><CR><C-Up>

    " RST for tagbar
    " I have a custom ctags for handling the hierarchy
    let g:tagbar_type_rst = {
        \ 'ctagstype' : 'reStructuredText',
        \ 'kinds'     : [
            \ 'H:titles',
            \ 'h:sub titles',
            \ 'c:chapters',
            \ 's:sections',
            \ 'S:subsections',
            \ 't:subsubsections'
        \ ],
        \ 'kind2scope' : {
            \ 'H' : 'title',
            \ 'h' : 'subtitle',
            \ 'c' : 'chapter',
            \ 's' : 'section',
            \ 'S' : 'subsection',
            \ 't' : 'subsubsection',
        \ },
        \ 'sro' : '.',
        \ 'sort': 0,
    \ }

endfunction

