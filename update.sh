#!/bin/bash

rm -rf luci-app-adguardhome
rm -rf luci-app-pushbot

git clone --depth 1 https://github.com/Hyy2001X/AutoBuild-Packages && mv -n AutoBuild-Packages/luci-app-adguardhome ./; rm -rf AutoBuild-Packages
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot

sed -i.bak -e "s#option binpath '/tmp/AdGuardHome/AdGuardHome'#option binpath '/usr/bin/AdGuardHome'#g" -e "s#option workdir '/usr/bin/AdGuardHome'#option workdir '/etc/AdGuardHome'#g" luci-app-adguardhome/root/etc/config/AdGuardHome
rm luci-app-adguardhome/root/etc/config/AdGuardHome.bak


rm -rf ./*/.git & rm -rf ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore

rm -rf create_acl_for_luci.err & rm -rf create_acl_for_luci.ok
rm -rf create_acl_for_luci.warn