
# Determine the light intensity around the laptop
LIGHT=$(cat /sys/devices/platform/applesmc.768/light | tr -d '()' | awk -F, '{print $1}' )
echo "Outside Light is ${LIGHT}"
MAX_DISPLAY_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness)
#echo ${MAX_DISPLAY_BRIGHTNESS}
CUR_DISPLAY_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
echo "Display Brightness ${CUR_DISPLAY_BRIGHTNESS} / ${MAX_DISPLAY_BRIGHTNESS}"


CUR_KEYBOARD_BACKLIGHT=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
MAX_KEYBOARD_BACKLIGHT=$(cat /sys/class/leds/smc::kbd_backlight/max_brightness)
echo "Keyboard Light is ${CUR_KEYBOARD_BACKLIGHT} / ${MAX_KEYBOARD_BACKLIGHT}"

sed -n '/^${LIGHT}/,+1p' lb.csv

#echo 900 | sudo tee /sys/class/backlight/intel_backlight/brightness

#CUR_DISPLAY_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
#echo ${CUR_DISPLAY_BRIGHTNESS}


