
module("luci.controller.meshviz", package.seeall)

function index()
	local page

	entry({"admin", "services", "meshviz"}, template("meshviz_graph"), _(translate("Mesh viewer")))
end
