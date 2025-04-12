--基本配置

--相对行号
vim.wo.number = true
vim.wo.relativenumber = true

--高亮光标所在行
vim.wo.cursorline = true

--缩进
vim.o.cindent = true
vim.o.cinoptions = 'go,L0,:0'


--Tab
--vim.opt.expandtab = true       -- 将 Tab 转换为空格
vim.opt.tabstop = 4            -- 一个 Tab 显示为四个空格
vim.opt.shiftwidth = 4         -- 自动缩进时使用四个空格
--vim.opt.softtabstop = 4        -- 插入时使用四个空格

--取消折行
vim.o.wrap = false
--启用终端颜色
vim.opt.termguicolors = true

--添加系统剪贴板
--vim.opt.clipboard = "unnamedplus"
local termfeatures = vim.g.termfeatures or {}
termfeatures.osc52 = true
vim.g.termfeatures = termfeatures

if vim.g.neovide then
    vim.o.guifont = "Maple Mono SC NF:h12"
    vim.opt.linespace = 0
    vim.g.neovide_cursor_vfx_mode = "wireframe"
    vim.g.neovide_transparency = 0.9 
    vim.g.neovide_input_ime = true
    vim.g.neovide_scroll_animation_length = 0.2

    local function set_ime(args)
        if args.event:match("Enter$") then
            vim.g.neovide_input_ime = true
        else
            vim.g.neovide_input_ime = false
        end
    end

    local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })
    
    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        group = ime_input,
        pattern = "*",
        callback = set_ime
    })
    
    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
        group = ime_input,
        pattern = "[/\\?]",
        callback = set_ime
    })

end

--配置特定文件的打开类型
-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = {"*.in", "*.h.in"},
--   callback = function()
--     vim.bo.filetype = "plaintext"
--   end,
-- })

vim.filetype.add({
	extension = {
		ixx = "cpp",
		h = "c",
	},
})


--vim.o.clipboard = "unnamedplus"

local function my_paste(reg)
    return function(lines)
        --[ 返回 “” 寄存器的内容，用来作为 p 操作符的粘贴物 ]
        local content = vim.fn.getreg('"')
        return vim.split(content, '\n')
        
    end
end

if (os.getenv('SSH_TTY') == nil)
then
    --[ 当前环境为本地环境，也包括 wsl ]
    --opt.clipboard:append("unnamedplus")
else
    --opt.clipboard:append("unnamedplus")
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        --[ 小括号里面的内容可能是毫无意义的，但是保持原样可能看起来更好一点 ]
        ["+"] = my_paste("+"),
        ["*"] = my_paste("*"),
    },
}
end
