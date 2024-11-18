-- 按键映射

--opt允许递归操作，opf不允许
local opt = {noremap=true, silent=true}
local opf = {noremap=false, silent=true}
--vim原始的map
local map = vim.api.nvim_set_keymap
local set = vim.keymap.set
local del = vim.keymap.del
local cmd = vim.api.nvim_create_user_command
--设置<leader>键
vim.g.mapleader = ','

-- 切屏
-- map('n', '<C-i>', '<C-w>', opf)
-- 撤销跳转
map('n', '<C-n>', '<C-i>', opt)
--取消搜索高亮
map('n', '<leader>n', ':noh<CR>', opt)
--cv
map('x', '<C-c>', '"+y', opf)
map('x', '<C-S-c>', '"+y', opf)
map('x', '<C-v>', '"+p', opf)
map('i', '<C-v>', '<Esc>"+p', opf)
map('i', '<C-S-v>', '<Esc>"+p', opf)

cmd('Pwd', "echo expand('%:p:h')", {})

-- 插件配置 ------------------------------------
local pluginKeys = {}

--nvim-tree
map('n', '<C-p>', ':NvimTreeToggle<CR>', opf)
pluginKeys.nvim_tree = function(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
	    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr) 	--启用默认配置
    del('n', '<Tab>', { buffer = bufnr })			--取消预览文件(Tab 和 <C-i>表示字符一样)
    set('n', '<C-]>', api.tree.change_root_to_node, opts('CD')) --将下一级目录作为根目录
    set('n', 'P', api.node.open.preview, opts('Preview'))
    -- 设置O为仅打开文件不移动光标
    local function open_and_return()
	api.node.open.edit()
	vim.cmd('wincmd h')
    end
    set('n', 'O', open_and_return, opts('Open and return'))
end

--barber
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opf)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opf)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opf)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opf)
map('n', '<A-BS>', '<Cmd>BufferClose<CR>', opf)
-- 将窗口固定在右侧
cmd('P', 'BufferPin', {})


--nvim-cmp
pluginKeys.cmp = function(cmp)
    return {
	-- 上一个
    	['<C-k>'] = cmp.mapping.select_prev_item(),
    	-- 下一个
    	['<C-j>'] = cmp.mapping.select_next_item(),
    	['<Tab>'] = cmp.mapping.select_next_item(),
    	-- 出现补全
    	-- ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    	-- 取消
    	-- ['<A-;>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
		-- 补全trigger
		['<C-e>'] = cmp.mapping(function(fallback)
			local mode = vim.api.nvim_get_mode().mode
			if cmp.visible() then
				if mode == 'i' then
					cmp.abort()
				else
					cmp.close()
				end
			else
				cmp.complete()
			end
		end, { 'i', 'c' }),
	}
end

--lsp
pluginKeys.maplsp = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    --转到声明
    set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    --转到定义
    set('n', 'gd', vim.lsp.buf.definition, bufopts)
    --签名显示
    set('n', 'gh', vim.lsp.buf.hover, bufopts)
    --转到实现
    set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    --
    set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    --重命名
    set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    -- 转到引用
    set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- 打开诊断窗口
    set('n', '<leader>a', vim.diagnostic.open_float, opt)
	-- 内联提示
	set('n', '<space><space>', function()
		    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opt)
    --格式化
    -- 设置格式化选中的范围
    vim.keymap.set('v', '<leader><leader>', function()
        -- 使用 vim.lsp.buf.format 对选中的代码进行格式化
        vim.lsp.buf.format({ range = {
            start = {vim.fn.line("v"), vim.fn.col("v")},
            ["end"] = {vim.fn.line("."), vim.fn.col(".")}
        }
    })
end, opts)
end

--nvim-gdb
vim.g.nvimgdb_disable_start_keymaps = 1
map('n', '<leader>b', '<Cmd>GdbBreakpointToggle<Cr>', opt)
cmd('Dgdb', function(args)
    local cmd = 'GdbStart gdb ' .. table.concat(args.fargs, ' ')
    vim.cmd(cmd)
end, { nargs = '*' })
cmd('Dlldb', 'GdbStartLLDB lldb', {})
vim.g.nvimgdb_config_override = {
	--disable
	key_frameup 	= '<leader>disable1',
	key_framedown 	= '<leader>disable2',
    key_eval 		= '<leader>disable3',
	--setting
	key_next 		= '<F9>',
	key_step 		= '<F10>',
    key_continue 	= '<F11>',
    key_finish 		= '<F12>',
	termwin_command	= 'belowright vnew',
    codewin_command	= 'vnew',
}

-- 浮动终端
map('n', '<leader>t', ':ToggleTerm<CR>', opf)

--telescope
local telescope = require 'telescope.builtin'
set('n', 'ff', telescope.find_files, {})
set('n', 'fg', telescope.live_grep, {})
set('n', 'fb', telescope.buffers, {})
set('n', 'fh', telescope.help_tags, {})

--[[
local dap = require 'dap'
local dapui = require 'dapui'
--dap
set('n', '<F5>', function() dap.continue() end, {})
set('n', '<F6>', function()
	dap.terminate()
	dap.disconnect({ terminateDebuggee = true })
	dap.close()
end, {})
set('n', '<leader>b', function() dap.toggle_breakpoint() end, {})
set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, {})
set('n', '<leader>lp',function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, {})
set('n', '<leader>dl',function() dap.run_last() end, {})
set('n', '<leader>dr',function() dap.repl.open() end, {})
set('n', '<leader>dq', function() dapui.close() end, {})
set('n', '<leader>dk', function() dapui.eval() end, {})
]]--


-- notify
-- 设置快捷键关闭悬浮通知
-- set("n", "<Esc>", function() require("notify").dismiss() end, {})

pluginKeys.gitsigns = function(bufnr)
	local gitsigns = require('gitsigns')
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

return pluginKeys


