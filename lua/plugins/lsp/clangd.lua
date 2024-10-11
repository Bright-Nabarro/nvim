--lsp clangd配置
local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

require('lspconfig').clangd.setup{
    on_attach = on_attach,
	filetypes = {'c', 'h', 'cpp', 'hpp', 'cc', 'hxx', 'cppm', 'ixx', 'mxx', 'objcpp', 'objc'},
    cmd = {
		'clangd',
		'--header-insertion=never',	--禁止自动插入头文件
		'--clang-tidy',
    	'--completion-style=detailed', 	--提供补全信息
		'--cross-file-rename=true',	--跨文件重命名
		--'--query-driver=gcc', --指定使用编译器
    	'--all-scopes-completion',	--启用所有作用域代码补全
		'--background-index', --后台索引
		'--inlay-hints',
    },
    initialization_options = {
        --fallback_flags = { "-std=c++20" },
    },
}

