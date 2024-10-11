local settingServers = {
    'clangd',
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
	'cmake'
}

require('mason-lspconfig').setup({
    ensure_installed = ensureServers,
})

local autoServers = {
	'cmake'
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
