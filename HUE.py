# -*- coding:utf-8 -*-
import requests
import os

HUE_API = f"http://{os.environ.get('HUE_ADDRESS')}/api/{os.environ.get('HUE_USERNAME')}/groups/0/action"

def set_HUE(on: bool, K: int, bri: int) -> None:
    requests.put(
        HUE_API,
        json = {
            'on': on,
            'ct': K2Mired(K),
            'bri': bri
        }
    )


# util
def K2Mired(K: int) -> int:
    return(int(round(1 / K * 1e6)))
