#!/bin/bash

AUTO_HOME=/home/pi/auto

# 明るさ設定取得
LIGHT_INTENSITY=`basename ${AUTO_HOME}/light*.touch | sed -e 's/[^0-9]//g'`

# 明るさ設定変更
if [ -e ${AUTO_HOME}/ir_on.touch ]; then
  DIFF=$(($1 - $LIGHT_INTENSITY))
  if (($DIFF>0)); then
    for((i=0;i<DIFF;i=i+20))
      do
        ${AUTO_HOME}/curl.sh light_up
        sleep 1
      done
  elif (($DIFF<0)); then
    for((i=0;i>DIFF;i=i-20))
      do
        ${AUTO_HOME}/curl.sh light_down
        sleep 1
      done
  fi
  rm ${AUTO_HOME}/light*.touch
  touch ${AUTO_HOME}/light$1.touch
fi

