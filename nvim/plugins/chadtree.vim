Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

nnoremap <leader>n <cmd>CHADopen<cr>

" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" let NERDTreeShowHidden=1
" let NERDTreeMinimalUI=1

" let g:NERDTreeDirArrowExpandable = '▹'
" let g:NERDTreeDirArrowCollapsible = '▿'

" nnoremap <expr> <leader>n g:CHADTree.IsOpen() ? ':CHADTreeClose<CR>' : @% == '' ? ':CHADTree<CR>' : ':CHADTreeFind<CR>'
" nmap <leader>N :NERDTreeFind<CR>

" " If more than one window and previous buffer was NERDTree, go back to it.
" autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" " avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
" let g:plug_window = 'noautocmd vertical topleft new'

" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsEnableFolderExtensionPatternMatching = 1
