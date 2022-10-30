#!/bin/bash
# Autor: Berg


if [ "$EUID" != 0 ]
        then echo "Por favor rode o setup como root."
        exit 1
fi

apt update
apt install curl git -y

git clone https://github.com/Berg777/bergwm
chmod 755 /bergwm/bergwm.sh
cp /bergwm/bergwm.sh /usr/bin/bergwm
rm -rf bergwm

echo -e "\033[1;32m----------------\033[0m"
echo -e "\033[1;32mSetup concluido!\033[0m"
echo -e "\033[1;32m----------------\033[0m"
