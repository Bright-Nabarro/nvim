--lsp clangd配置
local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

require('lspconfig').clangd.setup{
    on_attach = on_attach,
	filetypes = {'c', 'h', 'cpp', 'hpp', 'cc', 'hxx', 'cppm', 'ixx', 'mxx', --[['objcpp', 'objc']]},
    cmd = {
		'/usr/bin/clangd',
		'--compile-commands-dir='..vim.fn.getcwd()..'/build',
		'--header-insertion=never',	--禁止自动插入头文件
		'--clang-tidy',
    	'--completion-style=detailed', 	--提供补全信息
		-- '--query-driver=gcc', --指定使用编译器
    	'--all-scopes-completion',	--启用所有作用域代码补全
		'--background-index', --后台索引
    },
    initialization_options = {
        fallback_flags = { "--compile-commands-dir=~" },
    },
}

