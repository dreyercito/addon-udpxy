#!/usr/bin/with-contenv bashio
declare port
declare interface

port="5056"
if bashio::config.has_value "port"; then
    port=$(bashio::config "port")
fi

interface="end0"
if bashio::config.has_value "interface"; then
    interface=$(bashio::config "interface")
fi


#-T ?
exec udpxy -m "$interface" -p "$port"

