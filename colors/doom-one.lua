vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

vim.g['colors_name'] = 'doom-one'

package.loaded['doom-one'] = nil
require('doom-one').set_colorscheme()
