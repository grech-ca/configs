function! FloatingHelp(doc_name = "") abort
    let ui = nvim_list_uis()[0]

    let width = 80
    let height = 60

    let buf = nvim_create_buf(v:false, v:true)

    let opts = {
        \ 'relative': 'editor',
        \ 'width': width,
        \ 'height': height,
        \ 'col': (ui.width / 2) - (width / 2),
        \ 'row': (ui.height / 2) - (height / 2),
        \ 'border': 'rounded',
        \ }

    let win = nvim_open_win(buf, 1, opts)

    setlocal
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
        \ buftype=help
        \ filetype=help

    execute 'help ' . a:doc_name

    let help_buf = winnr()

    let closingKeys = ['<Esc>', '<CR>']

    for closingKey in closingKeys
        call nvim_buf_set_keymap(help_buf, 'n', closingKey, ':close<CR>', {'silent': v:true, 'nowait': v:true, 'noremap': v:true})
    endfor

    autocmd WinLeave *.txt :close
endfunction

command! -complete=help -nargs=? Help call FloatingHelp(<q-args>)
