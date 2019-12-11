let s:save_cpo = &cpo
set cpo&vim

function! s:build_palette() abort
  let col_base     = ['#808080', '#121212', 244, 233]
  let col_edge     = ['#17171b', '#8a8a8a', 234, 245]
  let col_error    = ['#161821', '#ff5f00', 234, 202]
  let col_gradient = ['#9e9e9e', '#303030', 247, 236]
  let col_nc       = ['#808080', '#121212', 244, 233]
  let col_warning  = ['#1c1c1c', '#ffaf00', 234, 214]
  let col_insert   = ['#1c1c1c', '#00ffaf', 234, 49]
  let col_replace  = ['#1c1c1c', '#ffaf00', 234, 214]
  let col_visual   = ['#1c1c1c', '#00d7ff', 234, 45]
  let col_red      = ['#ff5f00', '#1c1c1c', 202, 234]

  let p = {}
  let p.inactive = airline#themes#generate_color_map(
        \ col_nc,
        \ col_nc,
        \ col_nc)
  let p.normal = airline#themes#generate_color_map(
        \ col_edge,
        \ col_gradient,
        \ col_base)
  let p.insert = airline#themes#generate_color_map(
        \ col_insert,
        \ col_gradient,
        \ col_base)
  let p.replace = airline#themes#generate_color_map(
        \ col_replace,
        \ col_gradient,
        \ col_base)
  let p.visual = airline#themes#generate_color_map(
        \ col_visual,
        \ col_gradient,
        \ col_base)

  " Accents
  let p.accents = {
        \   'red': col_red,
        \ }

  " Error
  let p.inactive.airline_error = col_error
  let p.insert.airline_error = col_error
  let p.normal.airline_error = col_error
  let p.replace.airline_error = col_error
  let p.visual.airline_error = col_error

  " Warning
  let p.inactive.airline_warning = col_warning
  let p.insert.airline_warning = col_warning
  let p.normal.airline_warning = col_warning
  let p.replace.airline_warning = col_warning
  let p.visual.airline_warning = col_warning

  return p
endfunction

let g:airline#themes#ocean#palette = s:build_palette()

let &cpo = s:save_cpo
unlet s:save_cpo
