#!/bin/bash

set -e

echo "** Installing Netdata **"
bash <(curl -Ls https://my-netdata.io/kickstart.sh)

echo "** Enabling Netdata **"
sudo systemctl enable netdata
sudo systemctl start netdata

echo "Netdata installed successfully!"
echo "Access dashboard at http://localhost:19999"
