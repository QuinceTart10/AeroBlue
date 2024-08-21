#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Clone the repo
git clone https://gitgud.io/wackyideas/aerothemeplasma.git /tmp/atp
