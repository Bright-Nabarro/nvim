-- 主题配色

vim.cmd.colorscheme 'catppuccin'


if not vim.g.neovide then
	vim.cmd.highlight 'cursorLine gui=underline guibg=none'
else
	vim.cmd.highlight 'cursorline guibg=none guifg=none'
	--vim.cmd.highlight 'Normal guibg=#363636
	vim.g.terminal_color_0 = '#000000'
	vim.g.terminal_color_1 = '#ff5555'
	vim.g.terminal_color_2 = '#50fa7b'
	vim.g.terminal_color_3 = '#f1fa8c'
	vim.g.terminal_color_4 = '#bd93f9'
	vim.g.terminal_color_5 = '#ff79c6'
	vim.g.terminal_color_6 = '#8be9fd'
	vim.g.terminal_color_7 = '#bfbfbf'
	vim.g.terminal_color_8 = '#4d4d4d'
	vim.g.terminal_color_9 = '#ff6e6e'
	vim.g.terminal_color_10 = '#69ff94'
	vim.g.terminal_color_11 = '#ffffa5'
	vim.g.terminal_color_12 = '#d6acff'
	vim.g.terminal_color_13 = '#ff92df'
	vim.g.terminal_color_14 = '#a4ffff'
	vim.g.terminal_color_15 = '#ffffff'
end
