#9/3/2021
#execute neofetch if startx is not running
#prof of cocept

pro='startx'
var=$(ps -u $USER | awk '!seen[$4]++ {print $4}' | grep $pro)

if [[ "$(echo $var)" != "$(echo $pro)" ]]
    then
    neofetch
fi
