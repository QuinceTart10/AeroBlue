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
