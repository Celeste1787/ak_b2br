# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akdovlet <akdovlet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 19:50:55 by akdovlet          #+#    #+#              #
#    Updated: 2023/12/29 19:51:11 by akdovlet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARCHITECTURE=$(uname -a | awk '{$2""; print $0}')
#CPU=$(

MESSAGE="System Architecture: $ARCHITECTURE\n"

echo $MESSAGE
