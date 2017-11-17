--
--

require 'luci.sys'

m = Map("meshconfig", "Meshconfig", translate("ESP8266 management"))

--- Software AP settings ---
section_softap = m:section(NamedSection, "softap", "meshconfig", translate("Software AP settings"))  

ssid = section_softap:option(Value, "ssid",  translate("SSID"))
  ssid.default = "AS100G"
  ssid.cast = "string"
  ssid.rmempty = false
  ssid.optional = false

password = section_softap:option(Value, "password",  translate("Password"))
  password.default = "123456789"
  password.password = true
  password.rmempty = false
  password.optional = false

channel = section_softap:option(Value, "channel",  translate("Number of channel"))
  channel.default = 1
  channel.datatype = "and(uinteger, min(1), max(11))"
  channel.rmempty = false
  channel.optional = false

--- SIM info ---
section_station = m:section(NamedSection, "station", "meshconfig", translate("Station settings"))

ssid = section_station:option(Value, "ssid",  translate("SSID"))
  ssid.default = "AS100_STA"
  ssid.cast = "string"
  ssid.rmempty = false
  ssid.optional = false

password = section_station:option(Value, "password",  translate("Password"))
  password.default = "123456789"
  password.password = true
  password.rmempty = false
  password.optional = false



--- info ---
section_info = m:section(NamedSection, "info", "meshconfig", translate("Information"))

  refresher = section_info:option( Button, "refresher", translate("Refresh") )  
  refresher.title      = translate("Refresh Info")
  refresher.inputtitle = translate("Refresh")
  refresher.inputstyle = "apply"
  function refresher.write()
     luci.sys.call()
  end


function m.on_commit(self)
  -- Modified configurations got committed and the CBI is about to restart associated services
end

function m.on_init(self)
  -- The CBI is about to render the Map object
end

return m
