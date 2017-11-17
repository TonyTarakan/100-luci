--
--

require 'luci.sys'

m = Map("meshviz", "Meshviz", translate("AS100GW mesh network viewer"))

function m.on_commit(self)
  -- Modified configurations got committed and the CBI is about to restart associated services
end

function m.on_init(self)
  -- The CBI is about to render the Map object
end

return m
