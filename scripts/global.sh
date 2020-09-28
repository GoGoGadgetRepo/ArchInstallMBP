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
# Show an informative Error
error() {
	echo "${red}$1${red}"
	printf %${COLUMNS}s | tr " " "="
	echo "${reset}"
	exit 12
}
install() {
	[ -f $1 ] && info "Installing Packages from $1" || error "$1 is not a file."

	sudo pacman -Syyuu --noconfirm
	sudo pacman -S --noconfirm $(awk 'BEGIN{ORS=" "} {print $0}' $1)
	
}
