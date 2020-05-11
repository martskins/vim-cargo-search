function cs#CrateSelected()
  if has('nvim')
    :normal! yy
    :bd
    :e Cargo.toml
    :normal G
  else
    let @@ = s:data[a:option - 1] . "\n"
    :e Cargo.toml
    :normal G
  endif
endfunction

function! cs#CargoSearch(...)
  if a:0 == 0
    echo "ERROR: Need a crate name to search for"
    return
  endif

  let l:limit = 10
  let l:height = l:limit + 3
  let l:width = float2nr(&columns * 0.8)
  let l:cmd = 'cargo search --limit ' . l:limit . ' ' . a:1
  let s:data = split(system(l:cmd), '\n')

  if has('nvim')
    let opts = {
        \ 'relative': 'editor',
        \ 'row': float2nr(&lines / 2) - l:height,
        \ 'col': float2nr(&columns * 0.1),
        \ 'width': l:width,
        \ 'height': l:height,
        \ 'style': 'minimal'
        \ }
    let l:buf = nvim_create_buf(1, 1)
    :call nvim_open_win(l:buf, v:true, opts)
    :call nvim_buf_set_lines(l:buf, 0, -1, v:false, s:data)
    :call nvim_buf_set_option(l:buf, 'filetype', 'cargosearch')
  else
    let popmenu = popup_menu(s:data, #{
          \ filter: 'popup_filter_menu',
          \ callback: 'cs#CrateSelected',
          \ })
  endif
endfunction
