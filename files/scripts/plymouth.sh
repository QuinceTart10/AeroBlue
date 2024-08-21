#!/usr/bin/env bash

set -euo pipefail

# Set envvars
export PLYMOUTH_THEME_INSTALL_DIR=/usr/share/plymouth/themes
export BOOT_ANIM_START_DELAY=2
export BOOT_PROGRESS_CLEAR=0.99
export SMOD_WAIT_BOOT=6
export SMOD_WAIT_SHUTDOWN=8

# Replace placeholders in files
sed -i "s|@Plymouth_THEMESDIR@|$PLYMOUTH_THEME_INSTALL_DIR|g" /tmp/atp/misc/plymouth/plymouth-theme-smod/smod.plymouth
sed -i "s|@BOOT_ANIM_START_DELAY@|$BOOT_ANIM_START_DELAY|g" /tmp/atp/misc/plymouth/plymouth-theme-smod/smod.script
sed -i "s|@BOOT_PROGRESS_CLEAR@|$BOOT_PROGRESS_CLEAR|g" /tmp/atp/misc/plymouth/plymouth-theme-smod/smod.script
sed -i "s|@SMOD_WAIT_BOOT@|$SMOD_WAIT_BOOT|g" /tmp/atp/misc/plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation.service
sed -i "s|@SMOD_WAIT_SHUTDOWN@|$SMOD_WAIT_SHUTDOWN|g" /tmp/atp/misc/plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation-poweroff.service

# Move files to the appropriate locations
mkdir /usr/share/plymouth/themes/smod
mv /tmp/atp/misc/plymouth/plymouth-theme-smod/smod.plymouth /usr/share/plymouth/themes/smod/smod.plymouth
mv /tmp/atp/misc/plymouth/plymouth-theme-smod/smod.script /usr/share/plymouth/themes/smod/smod.script
mv /tmp/atp/misc/plymouth/plymouth-theme-smod/assets /usr/share/plymouth/themes/smod/assets
mv /tmp/atp/misc/plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation.service /usr/lib/systemd/system/smod-plymouth-wait-for-animation.service
mv /tmp/atp/misc/plymouth/plymouth-theme-smod/smod-plymouth-wait-for-animation-poweroff.service /usr/lib/systemd/system/smod-plymouth-wait-for-animation-poweroff.service

# Copy the Windows 7 Professional branding to the SDDM theme for consistency
cp /usr/share/plymouth/themes/smod/assets/branding-white.png /usr/share/sddm/themes/sddm-theme-mod/Assets/branding-white.png