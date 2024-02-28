#!/bin/bash

# Bootstrap script

set -euo pipefail

if [ -e /root/ran_customization ]; then
    exit
else
    NETWORK_CONFIG_FILE=/etc/NetworkManager/system-connections/Wired1 

    DEBUG_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.debug")
    DEBUG=$(echo "${DEBUG_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')
    LOG_FILE=/var/log/bootstrap.log
    if [ ${DEBUG} == "True" ]; then
        LOG_FILE=/var/log/ova-customization-debug.log
        set -x
        exec 2> ${LOG_FILE}
        echo
        echo "### WARNING -- DEBUG LOG CONTAINS ALL EXECUTED COMMANDS WHICH INCLUDES CREDENTIALS -- WARNING ###"
        echo "### WARNING --             PLEASE REMOVE CREDENTIALS BEFORE SHARING LOG            -- WARNING ###"
        echo
    fi

    HOSTNAME_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.hostname")
    IP_ADDRESS_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.ipaddress")
    NETMASK_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.netmask")
    GATEWAY_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.gateway")
    DNS_SERVER_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.dns")
    DNS_DOMAIN_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.domain")
    ROOT_PASSWORD_PROPERTY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.root_password")
    API_KEY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.api_key")

    ##################################
    ### No User Input, assume DHCP ###
    ##################################
    if [ -z "${HOSTNAME_PROPERTY}" ]; then
        cat > ${NETWORK_CONFIG_FILE} << __CUSTOMIZE_OS__
[connection]
id=Wired1
uuid=f11c2c6d-1ead-4635-87f0-41095463c784
type=802-3-ethernet

[802-3-ethernet]
mac=52:54:00:A4:FD:E0

[ipv4]
method=auto
dns=8.8.8.8

__CUSTOMIZE_OS__
    #########################
    ### Static IP Address ###
    #########################
    else
        HOSTNAME=$(echo "${HOSTNAME_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')
        IP_ADDRESS=$(echo "${IP_ADDRESS_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')
        NETMASK=$(echo "${NETMASK_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')
        GATEWAY=$(echo "${GATEWAY_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')
        DNS_SERVER=$(echo "${DNS_SERVER_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')
        DNS_DOMAIN=$(echo "${DNS_DOMAIN_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')

        echo -e "\e[92mConfiguring Static IP Address ..." > /dev/console
        cat > ${NETWORK_CONFIG_FILE} << __CUSTOMIZE_OS__
[connection]
id=Wired1
uuid=f11c2c6d-1ead-4635-87f0-41095463c784
type=802-3-ethernet

[802-3-ethernet]
mac=52:54:00:A4:FD:E0

[ipv4]
method=manual
dns=${DNS_SERVER}
addresses1=${IP_ADDRESS};${NETMASK};${GATEWAY};

[ipv6]
method=auto
ip6-privacy=2
__CUSTOMIZE_OS__

    echo -e "\e[92mConfiguring hostname ..." > /dev/console
    hostnamectl set-hostname ${HOSTNAME}
    echo "${IP_ADDRESS} ${HOSTNAME}" >> /etc/hosts
    echo -e "\e[92mRestarting Network ..." > /dev/console
    sudo systemctl restart NetworkManager
    fi

    echo -e "\e[92mConfiguring root password ..." > /dev/console
    ROOT_PASSWORD=$(echo "${ROOT_PASSWORD_PROPERTY}" | awk -F 'oe:value="' '{print $2}' | awk -F '"' '{print $1}')
    echo "root:${ROOT_PASSWORD}" | /usr/sbin/chpasswd

    # Ensure we don't run customization again
    touch /root/ran_customization
    API_KEY=$(vmtoolsd --cmd "info-get guestinfo.ovfEnv" | grep "guestinfo.api_key")
    if [[ ! -z ${API_KEY} && -f  /etc/telegraf/telegraf.conf ]]
    then
	    sed  -i -e 's/{{API_KEY}}/'${API_KEY}'/'  /etc/telegraf/telegraf.conf
	    sudo systemctl restart telegraf
    else
	    echo "Either API_KEY is not defined or telegraf.conf is not there"
    fi
    sudo reboot
fi
