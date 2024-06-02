#!/usr/bin/with-contenv bashio
declare port

port="5056"
if bashio::config.has_value "port"; then
    port=$(bashio::config "port")
fi

#-T ?

exec udpxy -m eth0 -p "$port"

