# README

## users 　テーブル

|Column            |Type   |Options    |
|------------------|-------|-----------|
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false|
|nickname          |string|null: false|

### Association

 - has_many :motivations
 - has_many :notifications
 - has_many :comments

## motivations テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user           | references | null: false, foreign_key: true  |
| purchase_date  | date |null: false|
| category_id    | integer | null: false |
| person         | text | 
| comment        | text | 
| intuition      | text | null: false |
| purpose        | text | null: false |

### Association

 - has_many :notifications
 - belongs_to :user
 - has_many :comments


 ## comments テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user_id | integer | 
| motivation_id | integer| 
| text | text | 

### Association

 - belongs_to :user
 - belongs_to :motivation


## notifications テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| motivation_id      | integer | 
| visiter_id  | integer| 
| visited_id     | integer | 
| action   | string  | 
| checked  | boolean | null: false | default: false|

### Association

 - has_many :notifications
 - has_one : motivation
 

