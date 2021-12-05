# ruby3-rails6-boilerplate

Ruby3 × Rails6 で Web アプリを作る際に良く使う gem や node_modules をまとめたボイラープレート。

## 内容

- テンプレートエンジン
  - slim-rails
- デコレーター
  - draper
- メール
  - letter_opener_web
- マスターデータ
  - active_hash
- 　テスト
  - rspec-rails
  - factory_bot_rails
- コード解析
  - rubocop
- 脆弱性チェック
  - brakeman
- N+1問題チェック
  - bullet
- ロギング
  - lograge
  - logstash-event
- デバッガー
  - pry-rails
- i18n
  - rails-i18n
  - enum_help
- デザイン
  - bootstrap
  - fontawesome
- 環境変数
  - dotenv-rails

## セットアップ

```
$ docker-compose build
$ docker-compose run web yarn install --check-files
$ docker-compose run web bundle exec rails webpacker:install
$ docker-compose up -d
$ docker-compose run web bundle exec rails db:create
```
