Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.9, 'height': 0.9, 'yoffset':0.5, 'xoffset': 0.5 } }
" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_OPTS = ' --layout=reverse --preview "bat --style=numbers --color=always"'

" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap(
    \   'files',
    \   fzf#vim#with_preview({
    \      'dir': <q-args>,
    \      'sink': 'e',
    \      'source': 'rg --files --smart-case --hidden -g "!.git/*"'
    \   }), <bang>0
    \ ))

" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? Docs
    \ call fzf#run(fzf#wrap(
    \   'files',
    \   fzf#vim#with_preview({
    \      'sink': 'e',
    \      'source': 'cd ~/.local/share/nvim/plugged && rg --files -g "**/doc/*.txt"'
    \   }), <bang>0
    \ ))

" Customise the Rg command to use rg which ignores background files
command! -bang -nargs=* Code
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading -g "!.git/*" -g "!yarn.lock" -g "!package-lock.json" --hidden --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

" Prevent FzF from opening buffers in sidebar (CHADtree) — https://github.com/junegunn/fzf.vim/issues/1359#issuecomment-1019717775
function ShiftFocusThenExecute(command)
    " Shift focus to the right/main window,
    " especially when focus is in sidebar.
    :wincmd l

    " Run commands like `:Files`.
    execute a:command
endfunction

nnoremap <Leader>f :call ShiftFocusThenExecute('Files')<CR>
nnoremap <Leader>h :call ShiftFocusThenExecute('Docs')<CR>
nnoremap <Leader>F :call ShiftFocusThenExecute('Code')<CR>
nnoremap <Leader>gb :call ShiftFocusThenExecute('GBranches')<CR>
