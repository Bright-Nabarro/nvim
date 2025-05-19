local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

require('lspconfig').rust_analyzer.setup{
    on_attach = on_attach,
	cmd = {"rust-analyzer"}, 
	filetypes = {"rust"},
	root_dir = function(fname)
	  return vim.loop.cwd()
	end,
	settings = {
		["rust_analyzer"] = {
			diagnostics = { enable = true, --[[启用诊断]] },
  		  inlayHints = {
  		    enable = true,           -- 启用内联提示
  		    typeHints = true,        -- 类型提示
  		    parameterHints = true,   -- 参数提示
  		    chainingHints = true,    -- 链式调用提示
  		  }
  		}
	}
}

