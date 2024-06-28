#!/usr/bin/env bash

set -euo pipefail

# Extract the theme
unzip /tmp/atp/Plymouth/plymouth-theme-smod.zip -d /tmp/atp/Plymouth

# Set envvars
export PLYMOUTH_THEME_INSTALL_DIR=/usr/share/plymouth/themes
export BOOT_ANIM_START_DELAY=2
export BOOT_PROGRESS_CLEAR=0.99
export SMOD_WAIT_BOOT=6
export SMOD_WAIT_SHUTDOWN=8

# Replace placeholders in files
sed -i "s|@Plymouth_THEMESDIR@|$PLYMOUTH_THEME_INSTALL_DIR|g" /tmp/atp/Plymouth/plymouth-theme-smod/smod.plymouth
sed -i "s|@BOOT_ANIM_START_DELAY@|$BOOT_ANIM_START_DELAY|g" /tmp/atp/Plymouth/plymouth-theme-smod/smod.script
sed -i "s|@BOOT_PROGRESS_CLEAR@|$BOOT_PROGRESS_CLEAR|g" /tmp/atp/Plymouth/plymouth-theme-smod/smod.script
sed -i "s|@SMOD_WAIT_BOOT@|$SMOD_WAIT_BOOT|g" /tmp/atp/Plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation.service
sed -i "s|@SMOD_WAIT_SHUTDOWN@|$SMOD_WAIT_SHUTDOWN|g" /tmp/atp/Plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation-poweroff.service

# Move files to the appropriate locations
mkdir /usr/share/plymouth/themes/smod
mv /tmp/atp/Plymouth/plymouth-theme-smod/smod.plymouth /usr/share/plymouth/themes/smod/smod.plymouth
mv /tmp/atp/Plymouth/plymouth-theme-smod/smod.script /usr/share/plymouth/themes/smod/smod.script
mv /tmp/atp/Plymouth/plymouth-theme-smod/assets /usr/share/plymouth/themes/smod/assets
mv /tmp/atp/Plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation.service /usr/lib/systemd/system/smod-plymouth-wait-for-animation.service
mv /tmp/atp/Plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation-poweroff.service /usr/lib/systemd/system/smod-plymouth-wait-for-animation-poweroff.service
