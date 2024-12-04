local settingServers = {
    'clangd',
	'cmake',
}
--mason 管理补全插件
require('mason').setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
})

local ensureServers = {
}

require('mason-lspconfig').setup({
    ensure_installed = ensureServers,
})

local autoServers = {
}

local lspconfig = require('lspconfig')
-- 包装keymap
local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

--使用手动设置，手动设置文件在lsp/lsp_name中
for _, lsp in ipairs(settingServers) do
    require('plugins.lsp.'..lsp)
end

for _, lsp in ipairs(autoServers) do
	require('lspconfig')[lsp].setup{
    	on_attach = on_attach,
	}
end

-- 签名边框
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded" -- 可以是 "rounded", "single", "double", "shadow" 等样式
})

vim.diagnostic.config({
  float = {
    border = "rounded", -- 设置诊断浮动窗口的边框样式
  }
})
