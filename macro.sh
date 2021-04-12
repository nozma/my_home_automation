#!/bin/bash

AUTO_HOME=/home/pi/auto

case $1 in

  light_off)
    ${AUTO_HOME}/HUE_adjust.sh False
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

  morning1)
    ${AUTO_HOME}/curl.sh hue_morning_1
    ;;

  morning2)
    ${AUTO_HOME}/curl.sh hue_morning_2
    ;; 

  morning3)
    ${AUTO_HOME}/curl.sh hue_morning_3
    ${AUTO_HOME}/curl.sh light_on
    ${AUTO_HOME}/set_light.sh 20
    ;; 

  morning4)
    ${AUTO_HOME}/set_light.sh 40
    ;; 

  morning5)
    ${AUTO_HOME}/set_light.sh 100
    ;; 

  night1)
    ${AUTO_HOME}/set_light.sh 80
    ${AUTO_HOME}/curl.sh hue_night_3
    ;;
  
  night2)
    ${AUTO_HOME}/set_light.sh 40
    ;;
  
  night3)
    ${AUTO_HOME}/curl.sh light_off
    ;;

  night4)
    ${AUTO_HOME}/curl.sh hue_night_2
    ;;
  
  night5)
    ${AUTO_HOME}/curl.sh hue_night_1
    ;;

esac
