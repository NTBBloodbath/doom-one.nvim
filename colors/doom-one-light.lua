vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

vim.g['colors_name'] = 'doom-one-light'

if vim.opt.background ~= 'light' then
	vim.opt.background = 'light'
end

package.loaded['doom-one-light'] = nil
require('doom-one-light')
