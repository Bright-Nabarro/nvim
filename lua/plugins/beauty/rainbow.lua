local rainbow_delimiters = require('rainbow-delimiters')

vim.cmd[[
	highlight RainbowDelimiterRed		guifg=#f08d8d
    highlight RainbowDelimiterYellow	guifg=#f2f2bf
    highlight RainbowDelimiterBlue		guifg=#b1dbf0
    highlight RainbowDelimiterOrange	guifg=#bdbfbf
    highlight RainbowDelimiterGreen		guifg=#a8d2af
    highlight RainbowDelimiterViolet	guifg=#d8a6ed
    highlight RainbowDelimiterCyan		guifg=#a9f5ec
]]

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        -- lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        -- lua = 210,
    },
    highlight = {
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
        --'RainbowDelimiterRed',
        'RainbowDelimiterGreen',
    },
}

