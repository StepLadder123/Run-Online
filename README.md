# アプリケーション名
Run-on


# アプリケーションの概要


# URL


# テスト用アカウント


# 利用方法


# 目指した課題解決


# 洗い出した要件


# 実装した機能についての画像やGIFおよびその説明


# 実装予定の機能
- ユーザー登録
- スコア登録
- スコア閲覧
- スコア削除
- コメント投稿
- ランキング表示
- コース登録
- コース挑戦

- デバイス別の表示切り替え
- 計測


# データベース設計


# テーブル設計

## usersテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| birthday   | date    | null: false |
| p_birthday | boolean |             |
| sex_id     | integer | null: false |
| p_sex      | boolean |             |
| area_id    | integer | null: false |
| p_area     | boolean |             |
| profile    | text    |             |

### Association

- has_many :scores
- has_many :courses
- has_many :comments
- has_many :challenges, through: :user_challenges

## scoreテーブル

| Column       | Type      | Options                    |
| ------------ | --------- | -------------------------- |
| distance     | integer   | null: false                |
| time         | time      | null: false                |
| area_id      | integer   | null: false                |
| date         | date      | null: false                |
| private      | boolean   |                            |
| challenge_id | integer   |                            |
| user_id      | reference | null: false, foreign: true |

### Association

- belongs_to :user
- belongs_to :challenge
- has_one :course
- has_many :comments

## commentテーブル

| Column   | Type      | Options                    |
| -------- | --------- | -------------------------- |
| text     | text      | null: false                |
| user_id  | reference | null: false, foreign: true |
| score_id | reference | null: false, foreign: true |

### Association

- belongs_to :user
- belongs_to :score

## courseテーブル

| Column   | Type      | Options                    |
| -------- | --------- | -------------------------- |
| feature  | text      |                            |
| user_id  | reference | null: false, foreign: true |
| score_id | reference | null: false, foreign: true |

### Association

- belongs_to :user
- belongs_to :score
- has_many :challenges

## challengeテーブル

| Column    | Type      | Options                    |
| --------- | --------- | -------------------------- |
| result    | boolean   |                            |
| course_id | reference | null: false, foreign: true |

### Association

- belongs_to :course
- has_one :score
- has_many :users, through: :user_challenges


# ローカルでの動作方法
