#!/bin/bash
#VPN BB
#238 minutos -> 3 horas e 58 minutos
#printf "xxx" | snx -> preencher a senha e executar comando
#snx -d -> desconectar a vpn

setup_vpn() {
   echo "Iniciar VPN"
   
   printf "senha" | snx
   echo "VPN rodando..."
   
   printf -v hoursAndMinutes "%(%H:%M)T\n"
   echo "$hoursAndMinutes"
   
   sleep 238m
   snx -d	
}

x=0

while [[ $x -le 4 ]]
do 
   echo "Rotina iniciada..."
   sleep 1s
   ((x++))
 
   setup_vpn
 
   if [[ $x -eq 3 ]] 
      then
      	echo "Reiniciando adaptador Wifi"
      	echo "senha" | sudo -S nmcli device disconnect wlp0s20f3
      	sleep 5s
      	sudo nmcli device connect wlp0s20f3
        sleep 5s
        echo "Finalizado"
      break
   fi
   
done


