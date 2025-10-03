vim.lsp.config.clangd = {
	cmd = {
		"/usr/bin/clangd",
		'--compile-commands-dir='..vim.uv.cwd()..'/build',
		'--header-insertion=never',	--禁止自动插入头文件
		'--clang-tidy',
    	'--completion-style=detailed', 	--提供补全信息
    	'--all-scopes-completion',	--启用所有作用域代码补全
		'--background-index', --后台索引
		"--pch-storage=memory", -- 将预编译头文件（PCH）存储在内存中，加快解析速度
	},
	filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
	root_markers = {
		"CMakeLists.txt",
    	".clang-tidy",
    	".clang-format",
    	"compile_commands.json",
    	"compile_flags.txt",
    	"configure.ac",
    	".git",
		vim.uv.cwd(),
	},
}

vim.lsp.enable("clangd")

