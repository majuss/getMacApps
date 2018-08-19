#!/bin/bash

cd ~/Downloads/

case "$1" in

Mactracker)
            mt=$(curl https://mactracker.ca/ | grep "Standalone" | grep -o '".*"' | sed s/\"//g)
            curl $mt -o mactracker.zip
            unzip mactracker.zip
            rm -rf __MACOSX mactracker.zip ~/Applications/Mactracker.app
            mv -f Mactracker.app ~/Applications/
            exit
            ;;
iTern)
            it=$(curl https://www.iterm2.com/downloads.html | grep stable | head -1 | sed 's/^.*\(href=\".*\"><img\).*$/\1/' | grep -o '".*"' | sed s/\"//g)
            curl $it -o iterm.zip
            unzip iterm.zip
            rm -rf iterm.zip ~/Applications/iTerm
            mv iTerm.app ~/Applications/
            exit
            ;;
Tunnelblick)
                curl -L https://tunnelblick.net/release/Latest_Tunnelblick_Stable.dmg -o tunnelblick.dmg
                hdiutil attach tunnelblick.dmg
                rm -rf tunnelblick.dmg ~/Applications/Tunnelblick
                cp /Volumes/Tunnelblick/Tunnelblick.app/ ~/Applications/
                hdiutil detach /Volumes/Tunnelblick
                exit
                ;;
Forklift)
            fl=$(curl https://binarynights.com/ | grep .zip | sed 's/^.*\(href=\".*\" class=\).*$/\1/' | grep -o '".*"' | sed s/\"//g)
            curl $fl -o forklift.zip
            unzip forklift.zip
            rm -rf forklift.zip ~/Applications/Forklift.app
            mv Forklift.app ~/Applications/
            exit
            ;;
MyTouchBarMyRules)
                    mt=$(curl https://github.com/Toxblh/MTMR/releases | grep .dmg | head -1 | sed 's/^.*\(href=\".*dmg\"\).*$/\1/' | grep -o '".*"' | sed s/\"//g)
                    mt="https://github.com$mt"
                    curl -L $mt -o mytmr.dmg
                    hdiutil attach mytmr.dmg
                    rm -rf mytmr.dmg ~/Applications/MTMR.app
                    cp /Volumes/MTMR/MTMR.app ~/Applications/MTMR.app
                    hdiutil detach /Volumes/MTMR
                    exit
                    ;;
HWMonitor)
            hw=$(curl https://github.com/kozlek/HWSensors/releases | grep .dmg | head -1 | sed 's/^.*\(href=\".*dmg.zip\"\).*$/\1/' | grep -o '".*"' | sed s/\"//g)
            hw="https://github.com$hw"
            curl -L $hw -o hwsensors.zip
            dmg=`unzip hwsensors.zip`
            dmg=`echo $dmg | sed -e 's/.*inflating: \(.*\) creating:.*/\1/'`
            hdiutil attach $dmg
            vol=`echo $dmg | sed 's/.Binaries.dmg//g'`
            vol2="/Volumes/$vol"
            vol="/Volumes/$vol/HWMonitor.app"
            vol=`echo $vol | sed 's/HWSensors./HWSensors Binaries v/'`
            vol2=`echo $vol2 | sed 's/HWSensors./HWSensors Binaries v/'`
            rm -rf hwsensors.zip $dmg ~/Applications/HWMonitor.app __MACOSX
            cp -R "$vol" ~/Applications/
            hdiutil detach "$vol2"
            exit
            ;;
mpv)
        mpv=$(curl -L https://laboratory.stolendata.net/~djinn/mpv_osx/mpv-latest.tar.gz -o mpv.tar.gz)
        tar -xzf mpv.tar.gz
        rm -rf mpv.tar.gz ~/Applications/mpv.app
        mv mpv.app ~/Applications/mpv.app
        exit
        ;;

GoogleChrome)
        curl -L "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" -o chrome.dmg
        hdiutil attach "chrome.dmg"
        rm -rf "chrome.dmg" "~/Applications/Google Chrome.app"
        cp -r "/Volumes/Google Chrome/Google Chrome.app" ~/Applications/
        hdiutil detach "/Volumes/Google Chrome"
        exit
        ;;

nightlyVLC)
        vlc=$(curl "https://nightlies.videolan.org/build/macosx-intel/last/"|grep \.dmg | grep -oE 'href\=\"([^\"]*)'|cut -c 7-)
        curl -L "https://nightlies.videolan.org/build/macosx-intel/last/$vlc" -o vlc.dmg

        hdiutil attach "vlc.dmg"
        rm -rf "vlc.dmg" "~/Applications/vlc-nightly.app"
        mkdir ~/Applications/vlc-nightly.app
        cp -r "/Volumes/VLC Media Player"/VLC.app/* ~/Applications/vlc-nightly.app/
        hdiutil detach "/Volumes/VLC Media Player"
        exit
        ;;

*) echo "ERROR"
   ;;
esac
