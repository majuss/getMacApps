#!/bin/bash

case "$1" in

Mactracker) cd ~/Downloads/
            mt=$(curl http://mactracker.ca/ | grep "Standalone" | grep -o '".*"' | sed s/\"//g)
            curl $mt -o mactracker.zip
            unzip mactracker.zip
            rm -rf __MACOSX mactracker.zip ~/Applications/Mactracker.app
            mv -f Mactracker.app ~/Applications/
            exit
            ;;
iTern)      cd ~/Downloads/
            it=$(curl https://www.iterm2.com/downloads.html | grep stable | head -1 | sed 's/^.*\(href=\".*\"><img\).*$/\1/' | grep -o '".*"' | sed s/\"//g)
            curl $it -o iterm.zip
            unzip iterm.zip
            rm -rf iterm.zip ~/Applications/iTerm
            mv iTerm.app ~/Applications/
            exit
            ;;
Tunnelblick)    cd ~/Downloads/
                curl -L https://tunnelblick.net/release/Latest_Tunnelblick_Stable.dmg -o tunnelblick.dmg
                hdiutil attach tunnelblick.dmg
                rm -rf tunnelblick.dmg ~/Applications/Tunnelblick
                cp /Volumes/Tunnelblick/Tunnelblick.app/ ~/Applications/
                hdiutil detach /Volumes/Tunnelblick
                exit
                ;;
Forklift)   cd ~/Downloads/
            fl=$(curl https://binarynights.com/ | grep .zip | sed 's/^.*\(href=\".*\" class=\).*$/\1/' | grep -o '".*"' | sed s/\"//g)
            curl $fl -o forklift.zip
            unzip forklift.zip
            rm -rf forklift.zip ~/Applications/Forklift.app
            mv Forklift.app ~/Applications/
            exit
            ;;
MyTouchBarMyRules)  cd ~/Downloads/
                    mt=$(curl https://github.com/Toxblh/MTMR/releases | grep .dmg | head -1 | sed 's/^.*\(href=\".*dmg\"\).*$/\1/' | grep -o '".*"' | sed s/\"//g)
                    mt="https://github.com$mt"
                    curl -L $mt -o mytmr.dmg
                    hdiutil attach mytmr.dmg
                    rm -rf mytmr.dmg ~/Applications/MTMR.app
                    cp /Volumes/MTMR/MTMR.app ~/Applications/MTMR.app
                    hdiutil detach /Volumes/MTMR
                    exit
                    ;;
HWMonitor)  cd ~/Downloads/
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
mpv)    cd ~/Downloads/
        mpv=$(curl -L https://laboratory.stolendata.net/~djinn/mpv_osx/mpv-latest.tar.gz -o mpv.tar.gz)
        tar -xzf mpv.tar.gz
        rm -rf mpv.tar.gz ~/Applications/mpv.app
        mv mpv.app ~/Applications/mpv.app
        exit
        ;;
*) echo "ERROR"
   ;;
esac