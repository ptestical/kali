#!/bin/bash
# Kali Linux Anpassungen nach einer frischen Installation 
# Getestet auf: Kali Linux 2021.3

# check ob root
if [ "$EUID" -ne 0 ]
        then echo "Bitte als root ausführen!"
        echo "sudo -i"
        exit
fi

# Tastatursprache ändern auf Deutsch
# Temporär im aktuellen Terminal
setxkbmap -layout de

# Permanente Änderung der Tastatursprache
sed -i /etc/default/keyboard -e 's/us/de/g'

# Standard-Passwort abändern
passwd

# System updaten, gedit/dirsearch installieren
sudo apt-get update
sudo apt-get install gedit
sudo apt-get install dirsearch

# relevante Tools für Pentest
sudo git clone https://github.com/carlospolop/PEASS-ng /opt/privilege_escalation
sudo git clone https://github.com/SecureAuthCorp/impacket /opt/impacket/

echo ""
echo "$(tput setaf 2)Erfolgreiche Installation!"
