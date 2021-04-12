#!/bin/bash

source /home/pi/auto/env.sh
AUTO_HOME=/home/pi/auto
PATH=/usr/local/bin:$PATH

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

esac
