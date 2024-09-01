local sept = {}

if vim.g.neovide then
    sept.component = { left = '', right = '' }
    sept.section = { left = '|', right = '|' }
else
    sept.component = { left = '', right = ''}
    sept.section = { left = '', right = ''}
end

require('lualine').setup {
    options = {
	icons_enabled = true,
	theme = 'auto',
      	component_separators = sept.component,
      	section_separators = sept.section,
      	disabled_filetypes = {
	    statusline = {},
	    winbar = {},
      	},
      	ignore_focus = {},
      	always_divide_middle = true,
      	globalstatus = false,
      	refresh = {
	    statusline = 1000,
	    tabline = 1000,
	    winbar = 1000,
      	}
    },
    sections = {
	lualine_a = {'mode'},
	lualine_b = {'branch', 'diff', 'diagnostics'},
    	lualine_c = {'filename'},
    	lualine_x = {'encoding', 'fileformat', 'filetype'},
    	lualine_y = {'progress'},
    	lualine_z = {'location'}
    },
    inactive_sections = {
	lualine_a = {},
      	lualine_b = {},
      	lualine_c = {'filename'},
      	lualine_x = {'location'},
      	lualine_y = {},
      	lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
