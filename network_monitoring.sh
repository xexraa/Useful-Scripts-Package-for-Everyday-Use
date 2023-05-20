#!/bin/bash

check_network() {
	ping -c 1 google.com >/dev/null 2>&1
	return $?
}

check_port() {
	host=$1
	port=$2
	timeout=$3
	nc -z -w $timeout $host $port >/dev/null 2>&1
	return $?
}

send_alert() {
	message=$1
	echo "ALERT: $message"

	# Display a popup window with the alert message using 'zenity'
	zenity --info --title="Network Monitoring Alert" --text="$message"
}

check_network
if [ $? -ne 0 ]
then
	send_alert "Network connectivity issue detected!"
fi

check_port google.com 80 5
if [ $? -ne 0 ]
then
	send_alert "Port 80 (HTTP) is closed!"
fi

check_port google.com 443 5
if [ $? -ne 0 ]
then
	send_alert "Port 443 (HTTPS) is closed!"
fi

echo "Network monitoring completed without any problems."

