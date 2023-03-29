#!/bin/bash

git rm -r --cache * >/dev/null 2>&1 &
rm -rf `find ./* -maxdepth 0 -type d` >/dev/null 2>&1

git clone --depth 1 https://github.com/Hyy2001X/AutoBuild-Packages && mv -n AutoBuild-Packages/luci-app-adguardhome ./; rm -rf AutoBuild-Packages
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns -b v5 package_mosdns && mv -n package_mosdns/luci-app-mosdns ./; mv -n package_mosdns/mosdns ./; mv -n package_mosdns/v2dat ./; rm -rf package_mosdns
git clone --depth 1 https://github.com/sbwml/v2ray-geodata

sed -i.bak -e "s#option binpath '/tmp/AdGuardHome/AdGuardHome'#option binpath '/usr/bin/AdGuardHome'#g" -e "s#option workdir '/usr/bin/AdGuardHome'#option workdir '/etc/AdGuardHome'#g" luci-app-adguardhome/root/etc/config/AdGuardHome
rm luci-app-adguardhome/root/etc/config/AdGuardHome.bak


rm -rf ./*/.git & rm -rf ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore

rm -rf create_acl_for_luci.err & rm -rf create_acl_for_luci.ok
rm -rf create_acl_for_luci.warn