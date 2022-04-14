# README

## users 　テーブル

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
 

