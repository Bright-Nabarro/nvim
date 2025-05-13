local M = {}
function M.is_wsl()
	local uname = io.popen("uname -r"):read("*l")
	return uname:lower():find("microsoft") ~= nil
end

return M

