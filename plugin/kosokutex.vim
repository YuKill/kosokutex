if exists('g:loaded_kosokutex')
    finish
endif

" load kosokutex
let g:loaded_kosokutex = 1
" default value is enabled
let g:kosokutex_enable = get(g:, 'kosokutex_enable', 1)

function! s:register_snippets()
    inoremap <leader>i \textit{}<Esc>i
    inoremap <leader>b \textbf{}<Esc>i

    nnoremap <leader>c :execute '!pdflatex ' . expand('%:t')<Cr>
    nnoremap <leader>b :execute '!biblatex ' . expand('%:t')<Cr>
    nnoremap <leader>e :execute '!evince ' . expand('%:t:r') . '.pdf&'<Cr>
endfunction

function! kosokutex#enable()
    autocmd FileType tex,plaintex call s:register_snippets()
endfunction

if g:kosokutex_enable
    call kosokutex#enable()
endif
