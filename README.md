### 変数

`/home/pi/auto`以下に配置する。

- `env.sh`内に記述しておく。
  - `REMO_ACCESS_TOKEN`: Nature Remoアクセストークン。
  - `REMO_LIGHT_SWITCH`: 自室照明の電源APIのurl。
  - `HUE_ADDRESS`: Hue BridgeのIPアドレス。
  - `HUE_USERNAME`: 次の手順で確認したusername。
    - `http://${HUE_ADDRESS}/debug/clip.html`にアクセス。
    - URLに`/api`、Message Bodyに`{"devicetype":"RaspberryPi"}`を入力。
    - Hue Bridgeのリンクボタンを押す。
    - POST実行。

### 参考文献

- [Raspberry PiではじめるDIYスマートホーム（第2版） - yagitch.com - BOOTH](https://booth.pm/ja/items/1034342)
