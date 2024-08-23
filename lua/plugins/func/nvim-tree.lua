local pluginKeys = require('keymap')

local function my_on_attach(bufnr)
    pluginKeys.nvim_tree(bufnr)
end

require('nvim-tree').setup({
    on_attach = my_on_attach,
    -- git支持
    git = {
        enable = false,
    },
})

