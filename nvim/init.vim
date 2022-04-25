"
"
"
"
"                                       _
"                                      | |
"                    __ _ _ __ ___  ___| |__
"                   / _` | '__/ _ \/ __| '_ \
"                  | (_| | | |  __/ (__| | | |
"                   \__, |_|  \___|\___|_| |_|
"                    __/ |
"                   |___/
"
"
"                  Configurations repository of
"
"              Mikhail Grechka <grech.code@gmail.com>
"
"
"
"

"-------------------- General Settings --------------------

set expandtab
set shiftwidth=2
set cursorline
set hidden
set icon
set list
set listchars=tab:>\ ,trail:•
set relativenumber
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes:2
set ignorecase
set smartcase
set number
set termguicolors
set nojoinspaces
set nowrap
set mouse=a
set splitright
set splitbelow
set clipboard=unnamedplus
set title
set confirm
set exrc
set updatetime=300
set redrawtime=10000
set undofile
set wildmode
set ruler
set nohlsearch
set modifiable

"-------------------------------------------------


"-------------------- Key maps --------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>Q :bufdo bdelete<cr>

" Disable command history
nnoremap q: <nop>
nnoremap Q <nop>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %

" Control current windows
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-------------------- Plugins --------------------

call plug#begin()

source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/chadtree.vim
source ~/.config/nvim/plugins/lion.vim
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/lastplace.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/rooter.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/targets.vim
source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/blamer.vim
source ~/.config/nvim/plugins/css-color.vim
source ~/.config/nvim/plugins/wakatime.vim
source ~/.config/nvim/plugins/dashboard.vim
source ~/.config/nvim/plugins/help.vim

call plug#end()

"-------------------------------------------------



"-------------------- Plugins --------------------

set updatetime=100

lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true
  }
}
EOF

"-------------------------------------------------



"-------------------- Appearance --------------------

syntax enable
colorscheme dracula


"-------------------- Colors --------------------

source ~/.config/nvim/colors/dashboard.vim
