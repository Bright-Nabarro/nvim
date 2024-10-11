local on_attach = function(client, bufnr)
    require('keymap').maplsp(client, bufnr)
end

require('lspconfig').cmake.setup{
	capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- 支持 nvim-cmp 补全
}
