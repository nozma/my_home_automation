# -*- coding:utf-8 -*-
import requests
import os
import csv
import datetime

HUE_API = f"http://{os.environ.get('HUE_ADDRESS')}/api/{os.environ.get('HUE_USERNAME')}/groups/0/action"
LIGHTING_SCHEDULE = list(csv.reader(open("./lighting_schedle.csv", "r")))[1:]


def set_HUE(on: bool, K: int, bri: int) -> None:
    requests.put(
        HUE_API,
        json = {
            'on': on,
            'ct': K2Mired(K),
            'bri': bri
        }
    )

def adjust_HUE() -> None:
    now_light_setting = get_light_setting_now()
    set_HUE(
        on = None,
        K = int(now_light_setting[1]),
        bri = int(now_light_setting[2])
    )

# util
def K2Mired(K: int) -> int:
    return(int(round(1 / K * 1e6)))

def get_light_setting_now() -> [int, int]:
    last_setting = list(
        filter(
            lambda x : datetime.datetime.strptime(x[0], '%H:%M').time() <= 
            datetime.datetime.now().time(),
           LIGHTING_SCHEDULE)
        )[-1]
    return(last_setting)


if __name__ == "__main__":
    adjust_HUE()