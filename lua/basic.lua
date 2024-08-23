--基本配置

--相对行号
vim.wo.number = true
vim.wo.relativenumber = true

--高亮光标所在行
vim.wo.cursorline = true

--缩进
vim.o.cindent = true
vim.o.cinoptions = 'go,L0,:0'


--Tab
vim.opt.expandtab = true       -- 将 Tab 转换为空格
vim.opt.tabstop = 4            -- 一个 Tab 显示为四个空格
vim.opt.shiftwidth = 4         -- 自动缩进时使用四个空格
vim.opt.softtabstop = 4        -- 插入时使用四个空格

--取消折行
vim.o.wrap = false
--启用终端颜色
vim.opt.termguicolors = true

