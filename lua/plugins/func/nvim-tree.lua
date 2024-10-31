local pluginKeys = require('keymap')

local function my_on_attach(bufnr)
    pluginKeys.nvim_tree(bufnr)
end

require('nvim-tree').setup({
    on_attach = my_on_attach,
    -- git支持
    git = {
        enable = true,
    },
	renderer = { icons = {
    	web_devicons = {
    		file = {
    			enable = true,
    			color = true,
    		},
    		folder = {
    			enable = false,
    			color = true,
    		},
    	},
    	git_placement = "after",
    	modified_placement = "after",
    	hidden_placement = "after",
    	diagnostics_placement = "signcolumn",
    	bookmarks_placement = "signcolumn",
    	padding = " ",
    	symlink_arrow = " ➛ ",
    	show = {
    	  file = true,
    	  folder = true,
    	  folder_arrow = true,
    	  git = true,
    	  modified = true,
    	  hidden = false,
    	  diagnostics = true,
    	  bookmarks = true,
    	},
    	glyphs = {
    	  default = "",
    	  symlink = "",
    	  bookmark = "󰆤",
    	  modified = "●",
    	  hidden = "󰜌",
    	  folder = {
    	    arrow_closed = "",
    	    arrow_open = "",
    	    default = "",
    	    open = "",
    	    empty = "",
    	    empty_open = "",
    	    symlink = "",
    	    symlink_open = "",
    	  },
    	  git = {
    	    unstaged = "",
    	    staged = "+",
    	    unmerged = "",
    	    renamed = "➜",
    	    untracked = "",
    	    deleted = "",
    	    ignored = "◌",
    	  },
    	},
    }, },
})

