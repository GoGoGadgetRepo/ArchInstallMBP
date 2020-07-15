for p in /sys/class/drm/*/status; do con=${p%/status}; echo -n "${con#*/card?-}: "; done
