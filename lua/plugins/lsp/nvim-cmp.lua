--管理各种补全候选项来源
--加载 luasnip 和 nvim-cmp 插件
local luasnip = require('luasnip')
local cmp = require('cmp')
local pluginKeys = require('keymap')
local lspkind = require('lspkind')

local before = function(entry, vim_item)
	vim_item.menu = ({		-- 补全项的来源信息
                nvim_lsp = '[L]',
                luasnip = '[sn]',
                buffer = '[F]',
                path = '[P]',
            })[entry.source.name]
            return vim_item
	end

cmp.setup({
    snippet = {
        -- 必须指定代码片段引擎
        expand = function(args)
            luasnip.lsp_expand(args.body) -- 使用 `luasnip`
        end,
    },
    mapping = pluginKeys.cmp(cmp),
    -- 配置补全菜单外观
    formatting = {
        format = lspkind.cmp_format({
	        mode = 'symbol',		--只显示图标
	        maxwidth = 50,		--最大宽度
	        ellipsis_char = '...',	--省略字符
	        before = before,		--自定义菜单项符号映射
	    }),
    },

    -- 设置补全来源的优先级
    sources = cmp.config.sources({
        { name = 'nvim_lsp', max_item_count=12 },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    })
})
