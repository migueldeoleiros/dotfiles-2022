#!/usr/bin/env bash

dateTime(){ #date-time
    echo -n $(date +"%a, %b %d %H:%M")
}

bat(){ #battery
    echo -n $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/{print $2}' | sed s/percentage://)
}

netName(){ #network
    echo -n $(nmcli connection show | awk 'NR==2{print $1}')
}

netQuality(){ #network quality
    q=$(echo "scale=1; ($(iwconfig wlp2s0 | awk '/Quality/{print $2}' | sed s/Quality=//))*100" | bc)
    echo -n $q
}

net(){ #network info
   echo -n "$(netName) $(netQuality)%"
}

while true; do
    xsetroot -name "  $(net)  |  BAT:$(bat)  |  $(dateTime)  "
    sleep 5s
done &
