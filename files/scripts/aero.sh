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
mv /tmp/atp/misc/mimetype/* /usr/share/mime/packages/

# Update the MIME database
update-mime-database /usr/share/mime

# Shell replacement
rm -rf /usr/share/plasma/shells/org.kde.plasma.desktop
mv /tmp/atp/plasma/shells/org.kde.plasma.desktop /usr/share/plasma/shells/org.kde.plasma.desktop

# Remove plasmoids that will be replaced
rm -rf /usr/share/plasma/plasmoids/org.kde.desktopcontainment
rm -rf /usr/share/plasma/plasmoids/org.kde.plasma.battery
rm -rf /usr/share/plasma/plasmoids/org.kde.plasma.keyboardlayout
rm -rf /usr/share/plasma/plasmoids/org.kde.plasma.networkmanagement
rm -rf /usr/share/plasma/plasmoids/org.kde.plasma.notifications
rm -rf /usr/share/plasma/plasmoids/org.kde.plasma.private.systemtray
rm -rf /usr/share/plasma/plasmoids/org.kde.plasma.volume

# Move plasmoids
mv /tmp/atp/plasma/plasmoids/io.gitgud.wackyideas.SevenStart /usr/share/plasma/plasmoids/io.gitgud.wackyideas.SevenStart
mv /tmp/atp/plasma/plasmoids/io.gitgud.wackyideas.digitalclocklite /usr/share/plasma/plasmoids/io.gitgud.wackyideas.digitalclocklite
mv /tmp/atp/plasma/plasmoids/io.gitgud.wackyideas.win7showdesktop /usr/share/plasma/plasmoids/io.gitgud.wackyideas.win7showdesktop
mv /tmp/atp/plasma/plasmoids/org.kde.desktopcontainment /usr/share/plasma/plasmoids/org.kde.desktopcontainment
mv /tmp/atp/plasma/plasmoids/org.kde.plasma.battery /usr/share/plasma/plasmoids/org.kde.plasma.battery
mv /tmp/atp/plasma/plasmoids/org.kde.plasma.keyboardlayout /usr/share/plasma/plasmoids/org.kde.plasma.keyboardlayout
mv /tmp/atp/plasma/plasmoids/org.kde.plasma.networkmanagement /usr/share/plasma/plasmoids/org.kde.plasma.networkmanagement
mv /tmp/atp/plasma/plasmoids/org.kde.plasma.notifications /usr/share/plasma/plasmoids/org.kde.plasma.notifications
mv /tmp/atp/plasma/plasmoids/org.kde.plasma.private.systemtray /usr/share/plasma/plasmoids/org.kde.plasma.private.systemtray
mv /tmp/atp/plasma/plasmoids/org.kde.plasma.volume /usr/share/plasma/plasmoids/org.kde.plasma.volume

# KWin stuff
rm -rf /usr/share/kwin/outline/plasma
mv /tmp/atp/kwin/outline/plasma /usr/share/kwin/outline/plasma
mv /tmp/atp/kwin/scripts/smodpeekscript /usr/share/kwin/scripts/smodpeekscript
mv /tmp/atp/kwin/tabbox/thumbnail_seven /usr/share/kwin/tabbox/thumbnail_seven

# Old effect removal (i gave up making the comments)
rm -rf /usr/share/kwin/effects/fadingpopups
rm -rf /usr/share/kwin/effects/login
rm -rf /usr/share/kwin/effects/morphingpopups
rm -rf /usr/share/kwin/effects/scale
rm -rf /usr/share/kwin/effects/squash

# Move effects
mv /tmp/atp/kwin/effects/fadingpopups /usr/share/kwin/effects/fadingpopups
mv /tmp/atp/kwin/effects/login /usr/share/kwin/effects/login
mv /tmp/atp/kwin/effects/morphingpopups /usr/share/kwin/effects/morphingpopups
mv /tmp/atp/kwin/effects/scale /usr/share/kwin/effects/scale
mv /tmp/atp/kwin/effects/smodpeekeffect /usr/share/kwin/effects/smodpeekeffect
mv /tmp/atp/kwin/effects/squash /usr/share/kwin/effects/squash

# Themes
mv /tmp/atp/misc/kvantum/Kvantum/Windows7Kvantum_Aero /usr/share/Kvantum/Windows7Kvantum_Aero
tar -xzf /tmp/atp/misc/sounds/sounds.tar.gz -C /usr/share/sounds
tar -xzf /tmp/atp/misc/icons/Windows\ 7\ Aero.tar.gz -C /usr/share/icons
tar -xzf /tmp/atp/misc/cursors/aero-drop.tar.gz -C /usr/share/icons
