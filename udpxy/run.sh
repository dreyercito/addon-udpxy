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
echo Listening in "$interface/$port"

exec /usr/local/bin/udpxy -v -m "$interface" -p "$port"
echo Exec aborted

