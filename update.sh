#!/bin/bash

# git rm -r --cache * >/dev/null 2>&1 &
rm -rf `find ./* -maxdepth 0 -type d` >/dev/null 2>&1

git clone --depth 1 https://github.com/Hyy2001X/AutoBuild-Packages && mv -n AutoBuild-Packages/luci-app-adguardhome ./; rm -rf AutoBuild-Packages
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot
git clone --depth 1 https://github.com/linkease/istore && mv -n istore/luci/* ./; rm -rf istore
git clone --depth 1 https://github.com/linkease/nas-packages && mv -n nas-packages/network/services/ddnsto ./; rm -rf nas-packages
git clone --depth 1 https://github.com/linkease/nas-packages-luci && mv -n nas-packages-luci/luci/luci-app-ddnsto ./; rm -rf nas-packages-luci

sed -i.bak -e "s#option binpath '/tmp/AdGuardHome/AdGuardHome'#option binpath '/usr/bin/AdGuardHome'#g" -e "s#option workdir '/usr/bin/AdGuardHome'#option workdir '/etc/AdGuardHome'#g" luci-app-adguardhome/root/etc/config/AdGuardHome
rm luci-app-adguardhome/root/etc/config/AdGuardHome.bak


rm -rf ./*/.git & rm -rf ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore
