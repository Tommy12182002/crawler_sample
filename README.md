# SitePrismのサンプル

## Capybaraの設定
- デフォルトではFirefoxを使う用になっているので、`Capybara.register_driver :selenium` でchrome driverを使用するように設定する。

- デフォルトではrack_testドライバを使用するようになっているが、javascriptをサポートしていないので`config.default_driver = :selenium`でseleniumを使用するようにする。

## 何をしているか
とりあえずクローリングのテストということで、googleから適当な文字列を検索して検索結果のtitleを取得するようにしてる。
