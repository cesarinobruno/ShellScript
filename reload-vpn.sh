#!/bin/bash
#VPN BB
#210 minutos -> 3 horas e 30 minutos
#printf "xxx" | snx -> preencher a senha e executar comando
#snx -d -> desconectar a vpn

setup_vpn() {
   echo "Iniciar VPN"
   
   printf "xxxx" | snx
   echo "VPN rodando..."
   
   sleep 210m
   snx -d	
}

x=0

while [[ $x -le 3 ]]
do 
   echo "Rotina iniciada..."
   sleep 1s
   ((x++))
 
   setup_vpn
 
   if [[ $x -eq 2 ]] 
      then
        echo "Finalizado"
      break
   fi
   
done



