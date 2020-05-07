#!/usr/bin/zsh
################################################################################
# Automatic Brightness Control (abc)
# File name : abc.sh
# Author : Masroor Rasheed
# email : masroor.rasheed@gmail.com
################################################################################


# Files that are utilized in this process.
SETTINGS_FILE="/home/masroor/Git/ArchInstallMBP/scripts/lb.csv"
DISPLAY_FILE="/sys/class/backlight/intel_backlight/brightness"
KEYBOARD_FILE="/sys/class/leds/smc::kbd_backlight/brightness"
LIGHT_FILE="/sys/devices/platform/applesmc.768/light"

# Determine the light intensity around the laptop
LIGHT=$(cat  ${LIGHT_FILE} | tr -d '()' | awk -F, '{print $1}' )
echo "Outside Light is ${LIGHT}"

# Maximum and Current Display Brightness
MAX_DISPLAY_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness)
CUR_DISPLAY_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
echo "Display Brightness ${CUR_DISPLAY_BRIGHTNESS} / ${MAX_DISPLAY_BRIGHTNESS}"

# Maximum and Current Back light for keyboard
CUR_KEYBOARD_BACKLIGHT=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
MAX_KEYBOARD_BACKLIGHT=$(cat /sys/class/leds/smc::kbd_backlight/max_brightness)
echo "Keyboard Light is ${CUR_KEYBOARD_BACKLIGHT} / ${MAX_KEYBOARD_BACKLIGHT}"

# Setting the new value based on configuration file
NEW_KEYBOARD_BACKLIGHT=$(grep ^$LIGHT, ${SETTINGS_FILE} | cut -d, -f2)
NEW_DISPLAY_BRIGHTNESS=$(grep ^$LIGHT, ${SETTINGS_FILE} | cut -d, -f3)

if [ -z $NEW_KEYBOARD_BACKLIGHT ]; then
	echo "${LIGHT},${CUR_KEYBOARD_BACKLIGHT},${CUR_DISPLAY_BRIGHTNESS}" >> ${SETTINGS_FILE}
	NEW_KEYBOARD_BACKLIGHT=${CUR_KEYBOARD_BACKLIGHT}
	NEW_DISPLAY_BRIGHTNESS=${CUR_DISPLAY_BRIGHTNESS}
fi

echo ${NEW_DISPLAY_BRIGHTNESS} | sudo tee ${DISPLAY_FILE}
echo ${NEW_KEYBOARD_BACKLIGHT} | sudo tee ${KEYBOARD_FILE}
