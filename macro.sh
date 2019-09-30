#!/bin/bash

AUTO_HOME=/home/pi/auto

case $1 in

  light_off)
    ${AUTO_HOME}/curl.sh hue_off
    ${AUTO_HOME}/curl.sh light_off
    ;;

  light10)
    ${AUTO_HOME}/curl.sh hue_1
    ${AUTO_HOME}/curl.sh light_off
    ;;

  light20)
    ${AUTO_HOME}/curl.sh hue_1
    ${AUTO_HOME}/curl.sh light_on
    ${AUTO_HOME}/set_light.sh 20
    ;;

  light40)
    ${AUTO_HOME}/curl.sh hue_1
    ${AUTO_HOME}/curl.sh light_on
    ${AUTO_HOME}/set_light.sh 40
    ;;

  light60)
    ${AUTO_HOME}/curl.sh hue_2
    ${AUTO_HOME}/curl.sh light_on
    ${AUTO_HOME}/set_light.sh 60
    ;;

  light80)
    ${AUTO_HOME}/curl.sh hue_2
    ${AUTO_HOME}/curl.sh light_on
    ${AUTO_HOME}/set_light.sh 80
    ;;

  light100)
    ${AUTO_HOME}/curl.sh hue_2
    ${AUTO_HOME}/curl.sh light_on
    ${AUTO_HOME}/set_light.sh 100
    ;;
esac
