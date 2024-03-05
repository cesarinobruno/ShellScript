#!/bin/bash
#VPN Connectis

echo "Verificando se tem conexão aberta..."
sleep 2

connection=$(openvpn3 sessions-list)
status=$(echo "$connection" | awk 'NR==2 {print $2}')
hash=$(echo "$status" | sed 's/.*\/sessions\/\([^?]*\).*/\1/')

if [ "$status" ]; 
 then
   echo "Conexão aberta..."
   echo "Fechando conexão"
  sleep 3
   openvpn3 session-manage --session-path /net/openvpn/v3/sessions/$hash --disconnect
  
  sleep 3
   echo "Executando VPN, informe suas credencias: "
   openvpn3 session-start --config Documentos/CONNECTIS-udp-1194-BrunoCesarino-config.ovpn
  
else 
   echo "Não tem conexão aberta"
   echo "Executando VPN, informe suas credencias: "
   openvpn3 session-start --config Documentos/CONNECTIS-udp-1194-BrunoCesarino-config.ovpn	
fi

