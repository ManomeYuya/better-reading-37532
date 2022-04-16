# アプリ名
Better-Reading-37532

# アプリケーション概要
読書をする動機や目的を記録し、目的意識を忘れず持つことで、読書をよりよくするためのアプリケーション。

# URL
https://immense-harbor-06341.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード：2222
・Basic認証ID：admin
・メールアドレス：test@com
・パスワード：test11
# 利用方法

## 本を読む動機を投稿する
・投稿一覧ページ（トップページ）から、ユーザー新規登録を行う
・投稿一覧ページから、新規投稿ボタン（NewMotivation）をクリックし、新規投稿をする
・投稿されたら投稿一覧ページに表示される

## 投稿の編集、削除、コメントの確認ができる
・投稿された動機の画像をクリックすると、詳細ページから投稿の編集、削除ができる
・詳細ページにはコメントが表示される

## ユーザー同士のコミュニケーションをとる
・他のユーザーが投稿した動機の画像をクリックすると、詳細ページからコメントを入力できる

# アプリケーションを作成した背景
私自身が本を読むにあたって、何かしらの動機やきっかけがあり購入したものの、読む頃にはなぜ読もうと思ったのか忘れてしまうことが多かったからです。
読書をする時は目的意識を持つことで読んだ後に身になると思います。
そこで、購入したタイミングで動機やきっかけを投稿し、いつでも見返すことができるアプリを開発することにしました。

# 洗い出した要件
要件定義シート
https://docs.google.com/spreadsheets/d/1ilysZpn1Va-bW8vx7kCCRvQ8T0eOxKk8O49D3-2Cros/edit#gid=982722306

# 追加実装したい機能
・ユーザーのフォロー機能：ユーザー同士の関わり合いが少ないため
・管理者制限：不適切な投稿を削除したりユーザーを制限することでサービスの安全性を高めるため

# データベース設計

## users テーブル

|Column            |Type   |Options    |
|------------------|-------|-----------|
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false|
|nickname          |string|null: false|

### Association

 - has_many :motivations
 - has_many :comments
 - has_many :favorites

## motivations テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user_id        |integer| 
| purchase_date  | date |null: false|
| category_id    | integer | null: false |
| title          | string |  null: false |
| person         | text | 
| comment        | text | 
| intuition      | text | 
| purpose        | text | null: false |

### Association

 - has_many :favorites
 - belongs_to :user
 - has_many :comments


 ## comments テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user_id | integer | 
| motivation_id | integer| 
| text | text | null: false|

### Association

 - belongs_to :user
 - belongs_to :motivation

  ## favorites テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user | references | null: false,foreign_key: true|
| motivation | references| null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :motivation

# 工夫したポイント
  ・投稿機能にて、動機をより深ぼれる投稿欄を設けました。心境を具体的に記録することで、より購入した時のことを思い出すことができると思います。



