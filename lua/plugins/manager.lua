--插件管理

--检测lazy并自动安装
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('lazy').setup{
    --依赖
    --图标
    { 'nvim-tree/nvim-web-devicons' },
    --git状态
    { 'lewis6991/gitsigns.nvim' },
	{ "nvim-neotest/nvim-nio" },
    { 'nvim-tree/nvim-web-devicons' },

    --美化 `plugins.beauty`
    --主题配色
    { 'catppuccin/nvim', name = 'catppuccin' },
    --状态栏
    { 'nvim-lualine/lualine.nvim', },
    -- 彩虹括号
    { 'hiphish/rainbow-delimiters.nvim' },
    
    -- 弹窗
    { 'rcarriga/nvim-notify' },
	{ 'folke/noice.nvim' },

    --功能 `plugins.func`
    --文件可视化
    { 'nvim-tree/nvim-tree.lua', lazy = false, },
    --标签页
    { 'romgrk/barbar.nvim' },
    --调试
    -- { 'sakhnik/nvim-gdb' },
	{ 'mfussenegger/nvim-dap', dependencies = {
	  'rcarriga/nvim-dap-ui',
  	  'theHamsta/nvim-dap-virtual-text',
  	  'nvim-telescope/telescope-dap.nvim'},
  	},

    --surround
    { 'kylechui/nvim-surround', event = "VeryLazy" },
    --浮动终端
    { 'akinsho/toggleterm.nvim' },
    --查找
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = {
	  'nvim-lua/plenary.nvim' },
    },

    --lsp `plugins.lsp`
    {
      'hrsh7th/nvim-cmp', dependencies = {
      'onsails/lspkind.nvim',
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
	-- { 'nvim-treesitter/nvim-treesitter' },
}


