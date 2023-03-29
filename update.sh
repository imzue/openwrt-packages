#!/bin/bash

git clone --depth 1 https://github.com/Hyy2001X/AutoBuild-Packages && mv -n AutoBuild-Packages/luci-app-adguardhome ./; rm -rf AutoBuild-Packages

sed -i.bak -e "s#option binpath '/tmp/AdGuardHome/AdGuardHome'#option binpath '/usr/bin/AdGuardHome'#g" -e "s#option workdir '/usr/bin/AdGuardHome'#option workdir '/etc/AdGuardHome'#g" luci-app-adguardhome/root/etc/config/AdGuardHome
rm luci-app-adguardhome/root/etc/config/AdGuardHome.bak