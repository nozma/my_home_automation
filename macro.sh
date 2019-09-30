#!/bin/bash

source ./env.sh

case $1 in

  light1)
    ${AUTO_HOME}/curl.sh hue_1
    ${AUTO_HOME}/curl.sh light_off
    ;;

  light2)
    ${AUTO_HOME}/curl.sh hue_2
    ${AUTO_HOME}/curl.sh light_off
    ;;

  light3)
    ${AUTO_HOME}/curl.sh hue_off
    ${AUTO_HOME}/curl.sh light_on
    ;;

  light4)
    ${AUTO_HOME}/curl.sh hue_2
    ${AUTO_HOME}/curl.sh light_on
    ;;

  light_off)
    ${AUTO_HOME}/curl.sh hue_off
    ${AUTO_HOME}/curl.sh light_off
    ;;
esac
