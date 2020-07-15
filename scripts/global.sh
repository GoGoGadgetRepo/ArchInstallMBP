# Colour Variables
red=`tput setaf 1`
green=`tput setaf 2`
orange=`tput setaf 3`
reset=`tput sgr0`

# Screen Printing of the information passed
info() {
	#echo "${orange}"
	#printf %${COLUMNS}s | tr " " "="
	echo "${green}$1${orange}"
	printf %${COLUMNS}s | tr " " "="
	echo "${reset}"
}
