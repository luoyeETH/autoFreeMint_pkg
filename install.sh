#!/bin/bash
curl -s https://api.github.com/repos/luoyeETH/autoFreeMint_pkg/releases/latest | grep "browser_download_url.*autofreemint-linux" | cut -d '"' -f 4 | wget -O autofreemint-linux -i  -
chmod 755 *
./autofreemint-linux
