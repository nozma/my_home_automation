#!/bin/bash

source /home/pi/auto/env.sh
AUTO_HOME=/home/pi/auto

case $1 in

  light_on)
    if ! [ -e ${AUTO_HOME}/ir_on.touch ]; then
      touch ${AUTO_HOME}/ir_on.touch
      curl -X POST "${REMO_LIGHT_SWITCH}" -H "accept: application/json" -H "Authorization: Bearer ${REMO_ACCESS_TOKEN}"
    fi
    ;;


  light_off)
    if [ -e ${AUTO_HOME}/ir_on.touch ]; then
      rm ${AUTO_HOME}/ir_on.touch
      curl -X POST "${REMO_LIGHT_SWITCH}" -H "accept: application/json" -H "Authorization: Bearer ${REMO_ACCESS_TOKEN}"
      sleep 1
      curl -X POST "${REMO_LIGHT_SWITCH}" -H "accept: application/json" -H "Authorization: Bearer ${REMO_ACCESS_TOKEN}"
    fi
    ;;

  light_up)
    curl -X POST "${REMO_LIGHT_UP}" -H "accept: application/json" -H "Authorization: Bearer ${REMO_ACCESS_TOKEN}"
    ;;

  light_down)
    curl -X POST "${REMO_LIGHT_DOWN}" -H "accept: application/json" -H "Authorization: Bearer ${REMO_ACCESS_TOKEN}"
    ;;

  hue_1)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "bri":1, "hue":13401, "sat":204}' 
    ;;

  hue_2)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "bri":254, "hue":13401, "sat":204}' 
    ;;

  hue_off)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":false}'
    ;;
  
  hue_morning_1)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "ct":154, "bri":85}' 
    ;;

  hue_morning_2)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "ct":154, "bri":170}' 
    ;;

  hue_morning_3)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "ct":154, "bri":254}' 
    ;;

  hue_night_1)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "ct":357, "bri":85}' 
    ;;

  hue_night_2)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "ct":357, "bri":140}' 
    ;;

  hue_night_3)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true, "ct":357, "bri":200}' 
    ;;

esac
