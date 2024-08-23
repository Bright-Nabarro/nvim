--插件管理

--检测lazy并自动安装
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
	'git',
	'clone',
    	'--filter=blob:none',
    	'https://github.com/folke/lazy.nvim.git',
    	'--branch=stable', -- latest stable release
    	lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    --依赖
    --图标
    { 'nvim-tree/nvim-web-devicons' },
    --git状态
    { 'lewis6991/gitsigns.nvim' },
    --美化 `plugins.beauty`
    --主题配色
    { 'catppuccin/nvim', name = 'catppuccin' },
    --状态栏
    { 'nvim-lualine/lualine.nvim', },

    --功能 `plugins.func`
    --文件可视化
    { 'nvim-tree/nvim-tree.lua', lazy = false, },
    --标签页
    { 'romgrk/barbar.nvim' },
    --调试
    { 'sakhnik/nvim-gdb' },
    --surround
    { 'kylechui/nvim-surround', event = "VeryLazy" },

    --lsp `plugins.lsp`
    {
      'hrsh7th/nvim-cmp', dependencies = {
      'lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',		-- lsp auto-completion
      'hrsh7th/cmp-buffer',		-- buffer auto-completion
      'hrsh7th/cmp-path',		-- path auto-completion
      'hrsh7th/cmp-cmdline', },		-- cmdline auto-completion 
    },
    -- 补全引擎(由nvim-cmp调用)
    { 'L3MON4D3/LuaSnip', version = 'v2.*', },
    -- LSP 管理
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
	-- 函数补全
	{ 'ray-x/lsp_signature.nvim', event = "VeryLazy",},
    --语法高亮
	{ 'nvim-treesitter/nvim-treesitter' },
}

require('lazy').setup(plugins)
