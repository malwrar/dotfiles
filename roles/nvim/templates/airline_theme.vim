" Colors
let s:fg_tui={{ colors.light_grey.num }}
let s:fg_gui="{{ colors.light_grey.rgb }}"
let s:bg_tui={{ colors.black.num }}
let s:bg_gui="{{ colors.black.rgb }}'
let s:acc_tui={{ colors.white.num }}
let s:acc_gui="{{ colors.white.rgb }}"

" Color combos     gui fg    gui bg    tui fg    tui bg    options
let s:c_normal = [ s:fg_gui, s:bg_gui, s:fg_tui, s:bg_tui, "" ]
let s:c_invert = [ s:bg_gui, s:fg_gui, s:bg_tui, s:fg_tui, "" ]

" Color maps
let s:m_uniform = airline#themes#generate_color_map(s:c_normal, s:c_normal, s:c_normal)
let s:m_modified = { 'airline_c': s:c_invert }  " Make filename inverted

" Assign mappings to theme
let g:airline#themes#malwrar#palette = {}
let g:airline#themes#malwrar#palette.insert   = s:m_uniform
let g:airline#themes#malwrar#palette.normal   = s:m_uniform
let g:airline#themes#malwrar#palette.visual   = s:m_uniform
let g:airline#themes#malwrar#palette.replace  = s:m_uniform
let g:airline#themes#malwrar#palette.inactive = s:m_uniform
let g:airline#themes#malwrar#palette.insert_paste = s:m_uniform
"let g:airline#themes#malwrar#palette.insert_modified   = s:m_modified
"let g:airline#themes#malwrar#palette.normal_modified   = s:m_modified
"let g:airline#themes#malwrar#palette.visual_modified   = s:m_modified
"let g:airline#themes#malwrar#palette.replace_modified  = s:m_modified
"let g:airline#themes#malwrar#palette.inactive_modified = s:m_modified
