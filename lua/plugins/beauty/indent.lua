
require("ibl").setup({
	indent = {
	  char = "│",
	  tab_char = "│",
	  smart_indent_cap = true,
	},
	scope = {
	  enabled = true,
	  show_start = true,
	  show_end = true,
	  show_exact_scope = false,    -- 显示精确作用域
	  injected_languages = false,
	},
	exclude = {
    	filetypes = {
    	  "c",
    	  "cpp",
    	  "java",
    	  "rust",
    	  "go",
    	},
	}
})
