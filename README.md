### 変数

- `env.sh`内に記述しておく。
  - `AUTO_HOME`: リポジトリの配置場所へのパス。 
  - `REMO_ACCESS_TOKEN`: Nature Remoアクセストークン。
  - `REMO_LIGHT_SWITCH`: 自室照明の電源APIのurl。
  - `HUE_ADDRESS`: Hue BridgeのIPアドレス。
  - `HUE_USERNAME`: 次の手順で確認したusername。
    - `http://${HUE_ADDRESS}/debug/clip.html`にアクセス。
    - URLに`/api`、Message Bodyに`{"devicetype":"RaspberryPi"}`を入力。
    - Hue Bridgeのリンクボタンを押す。
    - POST実行。
