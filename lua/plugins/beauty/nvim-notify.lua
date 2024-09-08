vim.notify = require("notify")

require("notify").setup({
	stages = "fade_in_slide_out", -- Animation style
	timeout = 3000,               -- Notification timeout (in ms)
	background_colour = "#000000", -- Background color for notifications
	fps = 60,                     -- Frames per second for animations
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

