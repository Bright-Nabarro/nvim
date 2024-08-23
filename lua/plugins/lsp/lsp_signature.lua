local lsp_signature = require('lsp_signature')
lsp_signature.setup({
    bind = true,  			-- This is mandatory for the plugin to work
    doc_lines = 10,  			-- Number of lines to show in the documentation. Adjust as needed.
    floating_window = false,  	-- Use a floating window for signature
    floating_window_above_cur_line = false,
    max_height = 4;
    fix_pos = false,  		-- Set to true if you want the floating window to stay visible
    hint_enable = true,  		-- Show hint with parameter types
    hint_prefix = "",
    hi_parameter = "Search",  -- Highlight the active parameter
    handler_opts = {
        border = "rounded"  	-- Use "rounded" border for the floating window
    },
})
