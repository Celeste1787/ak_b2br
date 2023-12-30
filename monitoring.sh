# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akdovlet <akdovlet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 19:50:55 by akdovlet          #+#    #+#              #
#    Updated: 2023/12/30 01:46:35 by akdovlet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARCHITECTURE=$(uname -a | awk '{$2=""; print $0}')
CPU=$(grep -m 1 'cpu cores' /proc/cpuinfo | awk '{print $4}')
VCPU=$(grep -m 1 'siblings' /proc/cpuinfo | awk '{print $3}')
RAM=$(free --mega | grep Mem | awk '{ printf("%s/%sMB (%.1f%%)", $3, $2, $3/$2 * 100) }')
DISK=$(df -h --total | grep total | awk '{printf("%s/%s (%.1f%%)", $3, $2, $5) }')
CPUUSAGE=$(top -bn1 | grep '%Cpu' | awk '{ printf("%.1f%%", $2 + $3) }')
REBOOT=$(who -b | awk '{print $3 " " $4}')
LVM=$(if [ $(lsblk | grep lvm | wc -l) -eq 0 ]; then echo Inactive; else echo Active; fi)
TCP=$(grep TCP /proc/net/sockstat | awk '{print $3}')
USER=$(who | wc -l)
IP=$(hostname -I | awk '{print $1}')
MAC=$(ip link show | grep ether | awk '{print $2}')
SUDO=$(grep COMMAND /var/log/auth.log | wc -l)

wall -n "System Architecture	: $ARCHITECTURE
CPU physical cores	: $CPU
CPU virtual cores	: $VCPU
RAM Usage		: $RAM
Disk Usage		: $DISK
CPU Usage		: $CPUUSAGE
Last Reboot		: $REBOOT
LVM			: $LVM
TCP			: $TCP Established
Users logged		: $USER
Network			: $IP ($MAC)
Sudo calls		: $SUDO"
