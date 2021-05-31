hi clear
syntax reset

let g:colors_name = 'doom-one'

if &background != 'dark'
  set background=dark
end

lua << EOF
package.loaded['doom-one'] = nil

require('doom-one')
EOF
