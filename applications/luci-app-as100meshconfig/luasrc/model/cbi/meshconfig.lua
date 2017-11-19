--
--

require 'luci.sys'

m = Map("meshconfig", "Meshconfig", translate("Mesh network configurations"))

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

authmode = section_softap:option(ListValue, "authmode",  translate("Authorization mode"))
  authmode.default = "AUTH_WPA_WPA2_PSK"
  authmode:value("AUTH_OPEN")
  authmode:value("AUTH_WEP")
  authmode:value("AUTH_WPA_PSK")
  authmode:value("AUTH_WPA2_PSK")
  authmode:value("AUTH_WPA_WPA2_PSK")
  authmode:value("AUTH_MAX")
  authmode.optional = false

ssid_hidden = section_softap:option(Flag, "ssid_hidden", translate("Hidden AP"))
  ssid_hidden.rmempty = false


--- Station settings ---
section_station = m:section(NamedSection, "station", "meshconfig", translate("Station settings"))

enabled = section_station:option(Flag, "enabled", translate("Enable connection"))
  enabled.rmempty = false

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



--- IP settings ---
section_ip = m:section(NamedSection, "ip", "meshconfig", translate("IP settings"))

ipaddr = section_ip:option(Value, "ipaddr",  translate("IP address"))
  ipaddr.datatype = "ip4addr"

ipmask = section_ip:option(Value, "ipmask",  translate("IP mask"))
  ipmask.datatype = "ip4addr"

gateway = section_ip:option(Value, "gateway",  translate("Gateway address"))
  gateway.datatype = "ip4addr"



--- Cryptography settings ---
section_crypto = m:section(NamedSection, "crypto", "meshconfig", translate("Cryptography settings"))

keylen = section_crypto:option(Value, "keylen",  translate("Key length"))
  keylen.default = 16
  keylen.datatype = "and(uinteger, min(0), max(16))"
  keylen.rmempty = false
  keylen.optional = false




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
