#!/bin/bash
Banner()
{
    echo -e '\033[1;31m
 ▄▄▄▄   ▓█████  ██▀███    ▄████  █     █░ ███▄ ▄███▓
▓█████▄ ▓█   ▀ ▓██ ▒ ██▒ ██▒ ▀█▒▓█░ █ ░█░▓██▒▀█▀ ██▒
▒██▒ ▄██▒███   ▓██ ░▄█ ▒▒██░▄▄▄░▒█░ █ ░█ ▓██    ▓██░
▒██░█▀  ▒▓█  ▄ ▒██▀▀█▄  ░▓█  ██▓░█░ █ ░█ ▒██    ▒██ 
░▓█  ▀█▓░▒████▒░██▓ ▒██▒░▒▓███▀▒░░██▒██▓ ▒██▒   ░██▒
░▒▓███▀▒░░ ▒░ ░░ ▒▓ ░▒▓░ ░▒   ▒ ░ ▓░▒ ▒  ░ ▒░   ░  ░
▒░▒   ░  ░ ░  ░  ░▒ ░ ▒░  ░   ░   ▒ ░ ░  ░  ░      ░
 ░    ░    ░     ░░   ░ ░ ░   ░   ░   ░  ░      ░   
 ░         ░  ░   ░           ░     ░           ░   
      ░                                               \033[0m'
}

Help()
{
	echo "This program makes a wordlist with all possible words of the specified site"
	echo
	echo "How to use: bergwm <url> <output(wordlist name)>"
	echo "Output will be saved in ~/.bergwm"
	echo
	echo "Options:"
	echo "-h	Display this help"
}

Error()
{
        echo "Unknown Option. Type -h to display the help page."
}

no_arguments = "true"
while getopts ":h" option; do
        case $option in
                h)
                        Help
                        exit;;
                \?)
                        Error
                        exit;;
        esac
        no_arguments = "false"
done

[[ "$no_arguments" == "true" ]] && { Error; exit 1; }

DIRECTORY=~/.bergwm/
DIR_NAME=$DIRECTORY/$2

	if test -d "$DIRECTORY"; then
		:
	else
		mkdir ~/.bergwm/
	fi

Banner
echo -e "\033[1;34mWordlistmaker by Berg, 10/2022\033[0m"
echo
echo -e "\033[1;34mhttps://www.linkedin.com/in/lucas-lintz-869075208/\033[0m"
echo -e "\033[1;34mhttps://github.com/Berg777\033[0m"
echo

curl -s $1 | sed 's/[^a-zA-Z ]/ /g' | tr 'A-Z ' 'a-z\n' | grep '[a-z]' | sort -u > $DIR_NAME

echo -e "\nFile saved in "$DIR_NAME
