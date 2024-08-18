#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Clone the repo
git clone https://gitgud.io/wackyideas/aerothemeplasma-kde6.git /tmp/atp

# Extract the global theme
tar -xzf /tmp/atp/Plasma_Style/Seven-Black.tar.gz -C /usr/share/plasma/desktoptheme

# Extract the icon themes
tar -xzf /tmp/atp/Icons_and_cursors/icon_themes.tar.gz -C /usr/share/icons windowsicon/
tar -xzf /tmp/atp/Icons_and_cursors/aero-drop.tar.gz -C /usr/share/icons

# Move the Kvantum theme and color scheme
mv /tmp/atp/Kvantum/Windows7Kvantum_Aero /usr/share/Kvantum/Windows7Kvantum_Aero
mv /tmp/atp/AeroColorScheme1.colors /usr/share/color-schemes/AeroColorScheme1.colors

# Extract the SDDM theme
tar -xzf /tmp/atp/SDDM/sddm-theme-mod.tar.gz -C /usr/share/sddm/themes

# Remove Plasmoids that will be replaced with modified versions
rm -r /usr/share/plasma/plasmoids/org.kde.plasma.keyboardlayout
rm -r /usr/share/plasma/plasmoids/org.kde.plasma.notifications
rm -r /usr/share/plasma/plasmoids/org.kde.plasma.private.systemtray

# Extract the new plasmoids
tar -xzf /tmp/atp/Plasmoids/io.gitgud.wackyideas.win7showdesktop.tar.gz -C /usr/share/plasma/plasmoids
tar -xzf /tmp/atp/Plasmoids/org.kde.plasma.keyboardlayout.tar.gz -C /usr/share/plasma/plasmoids
tar -xzf /tmp/atp/Plasmoids/org.kde.plasma.notifications.tar.gz -C /usr/share/plasma/plasmoids
tar -xzf /tmp/atp/Plasmoids/org.kde.plasma.private.systemtray.tar.gz -C /usr/share/plasma/plasmoids

# Remove effects that will be replaces with modified versions
rm -r /usr/share/kwin/effects/fadingpopups
rm -r /usr/share/kwin/effects/morphingpopups
rm -r /usr/share/kwin/effects/scale
rm -r /usr/share/kwin/effects/squash

# Move the new JavaScript effects
mv /tmp/atp/KWin/js_effects/fadingpopups /usr/share/kwin/effects/fadingpopups
mv /tmp/atp/KWin/js_effects/morphingpopups /usr/share/kwin/effects/morphingpopups
mv /tmp/atp/KWin/js_effects/scale /usr/share/kwin/effects/scale
mv /tmp/atp/KWin/js_effects/squash /usr/share/kwin/effects/squash

# Extract the tabbox theme
tar -xzf /tmp/atp/KWin/tabbox/thumbnail_seven.tar.gz -C /usr/share/kwin/tabbox

# Replace the KWin outline
rm -r /usr/share/kwin/outline
tar -xzf /tmp/atp/KWin/outline/outline.tar.gz -C /usr/share/kwin
