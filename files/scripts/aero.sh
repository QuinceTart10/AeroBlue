#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Clone the repo
git clone https://gitgud.io/wackyideas/aerothemeplasma.git /tmp/atp

# Move stuff
mv /tmp/atp/plasma/color_scheme/AeroColorScheme1.colors /usr/share/color-schemes/AeroColorScheme1.colors
mv /tmp/atp/plasma/desktoptheme/Seven-Black /usr/share/plasma/desktoptheme/Seven-Black
mv /tmp/atp/plasma/look-and-feel/authui7 /usr/share/plasma/look-and-feel/authui7
mv /tmp/atp/plasma/sddm/sddm-theme-mod /usr/share/sddm/themes/sddm-theme-mod
mv /tmp/atp/plasma/smod /usr/share/smod

# Shell replacement
rm -rf /usr/share/plasma/shells/org.kde.plasma.desktop
mv /tmp/atp/plasma/shells/org.kde.plasma.desktop /usr/share/plasma/shells/org.kde.plasma.desktop
