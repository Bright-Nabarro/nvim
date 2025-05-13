vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_refresh_slow = 0

local function is_ssh()
	return vim.env.SSH_CLIENT or vim.env.SSH_TTY
end
if is_ssh() then
  vim.g.mkdp_open_to_the_world = 1          -- 允许远程访问
  vim.g.mkdp_open_ip           = "192.168.31.67"
	vim.g.mkdp_browser = 'none'
else
  vim.g.mkdp_open_to_the_world = 0          -- 只在本机
  vim.g.mkdp_open_ip           = "127.0.0.1"
end

vim.g.mkdp_port=8080
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_theme = 'light'
