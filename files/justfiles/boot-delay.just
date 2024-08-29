toggle-boot-delay:
  #!/usr/bin/env bash
  CHOICE=$(gum choose --limit 1 "Enable boot delay" "Disable boot delay" "" "Enable shutdown delay" "Disable shutdown delay")
  if [ $CHOICE = "Enable boot delay" ]; then
    systemctl enable smod-plymouth-wait-for-animation.service
  elif [ $CHOICE = "Disable boot delay" ]; then
    systemctl disable smod-plymouth-wait-for-animation.service
  elif [ $CHOICE = "Enable shutdown delay" ]; then
    systemctl enable smod-plymouth-wait-for-animation-poweroff.service
  elif [ $CHOICE = "Disable shutdown delay" ]; then
    systemctl disable smod-plymouth-wait-for-animation-poweroff.service
  fi
