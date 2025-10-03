local settingServers = {
    'clangd',
	'rust',
	'go',
	'python',
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
    require('plugins.lsp.lang.'..lsp)
end

for _, lsp in ipairs(autoServers) do
end

-- 签名边框
local _hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function(opts)
  opts = opts or {}
  opts.border = opts.border or 'rounded'
  return _hover(opts)
end


vim.diagnostic.config({
  float = {
    border = "rounded", -- 设置诊断浮动窗口的边框样式
  }
})
