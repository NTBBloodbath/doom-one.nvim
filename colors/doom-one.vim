lua << EOF
vim.cmd('hi clear')
vim.cmd('syntax reset')

vim.g['colors_name'] = 'doom-one'

if vim.opt.background ~= 'dark' then
    vim.opt.background = 'dark'
end

package.loaded['doom-one'] = nil
require('doom-one')
EOF
