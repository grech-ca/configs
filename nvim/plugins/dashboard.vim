Plug 'glepnir/dashboard-nvim'" Returns the directory of the first file in `argv` or `cwd` if it's empty

function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!
let g:session_default_name = FindSessionDirectory()

let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_section={
  \ 'find_file': {
    \ 'description': ['Find file                     <leader> f'],
    \ 'command': 'Files' },
  \ 'find_word': {
    \ 'description': ['Find word                     <leader> F'],
    \ 'command': 'Code' },
  \ 'toggle_terminal': {
    \ 'description': ['Toggle terminal               <leader> t'],
    \ 'command': 'FloatermToggle' },
  \ 'toggle_explorer': {
    \ 'description': ['Toggle explorer               <leader> n'],
    \ 'command': 'CHADopen' }
  \ }

let g:dashboard_custom_header = [
      \'                                                                              ',
      \'                                                                              ',
      \'        ██████╗ ██████╗ ███████╗ ██████╗██╗  ██╗         ██████╗ █████╗       ',
      \'       ██╔════╝ ██╔══██╗██╔════╝██╔════╝██║  ██║        ██╔════╝██╔══██╗      ',
      \'       ██║  ███╗██████╔╝█████╗  ██║     ███████║        ██║     ███████║      ',
      \'       ██║   ██║██╔══██╗██╔══╝  ██║     ██╔══██║        ██║     ██╔══██║      ',
      \'       ╚██████╔╝██║  ██║███████╗╚██████╗██║  ██║███████╗╚██████╗██║  ██║      ',
      \'        ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝      ',
      \'                                                                              ',
      \'                    Mikhail Grechka <grech.code@gmail.com>                    ',
      \'                                                                              ',
      \]

let g:dashboard_custom_footer = [FindSessionDirectory()]

"Disable scroll (https://github.com/glepnir/dashboard-nvim/issues/95)
" autocmd FileType dashboard set mouse=

autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
autocmd FileType dashboard set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2

