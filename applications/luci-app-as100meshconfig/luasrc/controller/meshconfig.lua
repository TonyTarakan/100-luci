
module("luci.controller.meshconfig", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/meshconfig") then
		return
	end

	local page

	page = entry({"admin", "services", "meshconfig"}, cbi("meshconfig"), _(translate("Meshconfig")))
	page.dependent = true
end
