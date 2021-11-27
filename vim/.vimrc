"syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
"set nu
set number relativenumber
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup 
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set scrolloff=5
set mouse=nicr
"set cursorline
set shell=sh
set ignorecase
set smartcase
set ballooneval
set hidden
"set termguicolors
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>


"/copyright      " Case insensitive
"/Copyright      " Case sensitive
"/copyright\C    " Case sensitive
"/Copyright\c    " Case insensitive
set colorcolumn=80
hi ColorColumn ctermbg=0 guibg=lightgrey

"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"#Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'AndrewRadev/tagalong.vim'
Plug 'sjl/splice.vim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'glippi/yarn-vim'
Plug 'neoclide/npm.nvim', {'do': 'npm install'}
Plug 'mbbill/undotree'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'APZelos/blamer.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'HerringtonDarkholme/yats'
Plug 'jiangmiao/auto-pairs'
Plug 'mhartington/vim-typings'
Plug 'Quramy/tsuquyomi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'alvan/vim-closetag'

call plug#end()
" Theme
colorscheme onedark
set background=dark

let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
" Variables
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsSnippetDirectories=['~/.vim-snippets']

" Leader key
let mapleader = " "

let g:blamer_enabled = 1
" ag is fast enough that CtrlP doesn't need to cache "
let g:ctrlp_use_caching = 0

" let g:HardMode_level = 'wannabe'
" let g:HardMode_hardmodeMsg = 'Хуй'

" let g:ale_linters = ['eslint', 'tslint', 'prettier', 'stylelint', 'typecheck']
let g:ale_linters = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'javascript.jsx': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'tslint', 'tsserver'],
    \ 'typescriptreact': ['prettier', 'tslint', 'tsserver'],
    \ }
let g:ale_fixers = {
   \ '*': ['remove_trailing_lines', 'trim_whitespace'],
   \ 'javascript': ['prettier', 'eslint'],
   \ 'javascript.jsx': ['prettier', 'eslint'],
   \ 'typescript': ['prettier', 'eslint'],
   \ 'typescriptreact': ['prettier', 'eslint'],
   \ 'css': ['prettier'],
   \ 'json': ['prettier'],
   \ }
let g:ale_completion_autoimport = 1

let g:ale_floating_preview = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_cursor = 0
let g:ale_detail_to_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_hover_to_preview = 1
let g:ale_cursor_detail = 1
let g:ale_lint_delay = 0
let g:ale_echo_delay = 400
let g:ale_completion_enabled = 1

let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeShowHidden = 1

let g:blamer_show_in_insert_modes = 0

let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1

"silent call CocActionAsync('doHover')
" let g:NERDTreeGitStatusIndicatorMapCustom = {
  " \ "Modified"  : "⋆",            
  " \ "Staged"    : "•",            
  " \ "Untracked" : "∘",            
  " \ "Dirty"     : "⁖",            
  " \ "Clean"     : "✔︎",                   
  " \ }
" let g:coc_global_extensions = [
  " \ 'coc-json',
  " \ 'coc-tsserver',
  " \ 'coc-prettier',
  " \ 'coc-eslint',
  " \ ]
let g:airline#extensions#tabline#enabled = 1

let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \ }

hi NERDTreeGitStatusUntracked ctermfg = 1
hi NERDTreeGitStatusClean ctermfg = 250
hi NERDTreeGitStatusDirty ctermfg = 39 
hi NERDTreeGitStatusStaged ctermfg = 2
hi NERDTreeGitStatusModified ctermfg = 220 
" hi CocErrorHighlight cterm = underline ctermfg = 1
" hi CocWarningHighlight cterm = underline ctermfg = 220
hi NERDTreeDir ctermfg = 15 
hi NERDTreeFile ctermfg = 15

let g:NERDTreeGitStatusHighlightingCustom = [
  \ ['Modified',  'GruvboxOrange'],
  \ ['Staged',    'GruvboxGreen'],
  \ ['Untracked', 'GruvboxRed'],
  \ ['Dirty',     'GruvboxBlue'],
  \ ['Clean',     'GruvboxGray'],
  \ ]
"#Mappings
" Control current windows
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" Comment lines
nmap <silent> <Leader>/ <plug>NERDCommenterToggle
vmap <silent> <Leader>/ <plug>NERDCommenterToggle

nnoremap <silent><leader>k :ALEHover<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Toggle NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <Leader>ps :Rg<SPACE>

" Go to type definition
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
" Fix current problem
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
nmap <leader>d :ALEGoToDefinition<CR>
nmap <leader>p :CtrlP<CR>
"#Macros

" Hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

map <c-i> <<
map <c-o> >> 

map <Enter> o<ESC>
map <S-Enter> O<ESC>

nnoremap gp :silent %!prettier --stdin-filepath %<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
