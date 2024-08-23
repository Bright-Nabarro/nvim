-- 透明化
-- Sign边界透明化， Mod修改后的状态透明化
local tspGrp = {
    'BufferCurrent',  'BufferCurrentMod', 'BufferCurrentSign' ,
    'BufferInactiveSign',
    'BufferVisible',  'BufferVisibleMod',  'BufferVisibleSign',
}
-- 透明斜体(字体变暗)
local tspItalicGrp = {
    'BufferInactive',  'BufferInactiveMod',
}

for _, group in ipairs(tspGrp) do
    vim.api.nvim_set_hl(0, group, { bg = 'none' })
end

local inactive_color = '#5c6370'
for _, group in ipairs(tspItalicGrp) do
    vim.api.nvim_set_hl(0, group, { fg = inactive_color, bg = 'none', italic = true })
end

require('barbar').setup {
    animation = true,	--开启动画效果
    maximun_length = 10,
    -- 设置NvimTree开启之后的偏移
    sidebar_filetypes = {
	NvimTree = {event = 'BufWinLeave', text = 'File_Expolre', align = 'left'},
    },
    --设置分隔符放置在右侧
    icons = {
	separator = { left = '', right = '▎' },
	separator_at_end = false,
	inactive = {
	    separator = { left = '', right = '▎' },
	    separator_at_end = false,
	},
    },
}
