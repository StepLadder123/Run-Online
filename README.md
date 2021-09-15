# アプリケーション名
Run-Online


# アプリケーションの概要
ランナーの走行記録（アクティビティ）の投稿、表示、管理するアプリケーション


# URL
https://run-online-42195.herokuapp.com/


# テスト用アカウント
- ユーザー1
  - ID
  test1@test.co.jp
  - Password
  a9b8c7
- ユーザー2
  - ID
  test2@test.co.jp
  - Password
  a9b8c7
- ユーザー3
  - ID
  test3@test.co.jp
  - Password
  a9b8c7
- ユーザー4
  - ID
  test4@test.co.jp
  - Password
  a9b8c7


# 利用方法
- ランニングを行ったらアクティビティを登録する
- 自身のアクティビティは他ユーザーのアクティビティと比較・競走する

# 目指した課題解決
- 離れたランナーとも繋がってモチベーションを高め、切磋琢磨できる。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1d4LxlS7mQeuBKQQMRIN4bws9xFq7IkInmJCikUtD53I/edit#gid=282075926

# 実装した機能についての画像やGIFおよびその説明

## トップ画面

  - 未ログイン時

    メッセージとログインボタン、新規登録ボタンがフェードアップして表示される。

    [![Image from Gyazo](https://i.gyazo.com/fdca45298d6292fbb212af2b00932020.gif)](https://gyazo.com/fdca45298d6292fbb212af2b00932020)

  - ログイン時

    - アクティビティなし

      未ログイン時と同様だが、ボタンがアクティビティ登録ボタンに変わる。

      [![Image from Gyazo](https://i.gyazo.com/6093d9e00c4310cd2d62ba61aee2873a.gif)](https://gyazo.com/6093d9e00c4310cd2d62ba61aee2873a)

    - アクティビティあり

      アクティビティ（ランニングの成績）が表示される。左側はコース画像の表示、右上段は投稿時刻と現在時刻の差分、ユーザー名、コメント数の表示、右下段は距離、タイム、ラップの表示。10件単位で表示され、下部に画面遷移のボタンが表示される。

      [![Image from Gyazo](https://i.gyazo.com/9f2db148f249c10fb5a2c00ace2c1b34.gif)](https://gyazo.com/9f2db148f249c10fb5a2c00ace2c1b34)

    - メニュー表示

      右上のハンバーガーメニュー押下でメニューが表示される。上からユーザー詳細（ログインユーザー名）、アクティビティ登録、アクテビティ検索、ランキング、ログアウトに遷移できる。

     [![Image from Gyazo](https://i.gyazo.com/7ba9ef1ad2e3373c05eb6cb997c59471.gif)](https://gyazo.com/7ba9ef1ad2e3373c05eb6cb997c59471)

## ユーザー登録

  ユーザー登録には、ニックネーム、メールアドレス、パスワード、確認尿パスワード、生年月日、年齢非公開チェック、性別、性別非公開チェック、主なランエリア、エリア非公開チェック、自己紹介を入力する。

  [![Image from Gyazo](https://i.gyazo.com/6d38dbdfc34bbaefc9cce0457bdb0371.png)](https://gyazo.com/6d38dbdfc34bbaefc9cce0457bdb0371)

  - 非公開設定

    各項目で非公開にしたい場合は、非公開チェック有にする。

    [![Image from Gyazo](https://i.gyazo.com/2ccdd571fc7e90343200b9f181096fd1.jpg)](https://gyazo.com/2ccdd571fc7e90343200b9f181096fd1)

## ユーザー詳細表示

  ユーザー情報、期間別成績、アクティビティ別成績が表示される。ログインユーザーによって編集ボタンの表示有無が異なる。

  [![Image from Gyazo](https://i.gyazo.com/36547f9ac3d31525d3a7c4dfd74d6d2f.png)](https://gyazo.com/36547f9ac3d31525d3a7c4dfd74d6d2f)

  - ログインユーザーのユーザー詳細表示時

    [![Image from Gyazo](https://i.gyazo.com/ebea21976468573677ea87e6b50536b5.png)](https://gyazo.com/ebea21976468573677ea87e6b50536b5)

  - ログインユーザー以外のユーザー詳細表示時

    [![Image from Gyazo](https://i.gyazo.com/e3d984e447be78601bd474b1ec348033.jpg)](https://gyazo.com/e3d984e447be78601bd474b1ec348033)

  - 非公開設定

    ユーザー登録時に非公開チェック有にした項目は「非公開」と表示される。
  
    [![Image from Gyazo](https://i.gyazo.com/b78dfab1e9a9eb59ea3a004300bd25c3.png)](https://gyazo.com/b78dfab1e9a9eb59ea3a004300bd25c3)

## ユーザー編集

  [![Image from Gyazo](https://i.gyazo.com/09b8762e5f677de0d549fc962965d717.gif)](https://gyazo.com/09b8762e5f677de0d549fc962965d717)

## アクティビティ登録

  - ユーザー情報公開設定時

    コース画像、日付、距離、タイム、エリア、アクティビティ非公開チェックを入力する。

    [![Image from Gyazo](https://i.gyazo.com/b23df75577045813ef265ac02306ccf9.png)](https://gyazo.com/b23df75577045813ef265ac02306ccf9)

  - ユーザー情報非公開設定時

    ユーザー情報でいずれかの項目で非公開に設定した場合は、デフォルトでアクティビティ非公開チェック有で表示され、注意文言が表示される。

    [![Image from Gyazo](https://i.gyazo.com/ffcfcc1c8461b16272a161bdb0e82ee6.jpg)](https://gyazo.com/ffcfcc1c8461b16272a161bdb0e82ee6)

  - アクティビティ登録の挙動

    - 公開設定時

      登録されたアクティビティはトップ画面の最上部に表示される。

      [![Image from Gyazo](https://i.gyazo.com/fc50499cbfe41717b170b4b2ba900808.gif)](https://gyazo.com/fc50499cbfe41717b170b4b2ba900808)

    - 非公開設定時

      アクティビティ非公開チェック有で登録した場合は、トップ画面に表示されない。後述するアクティビティ検索やランキング機能でも非公開チェック有のアクティビティは表示・集計の対象外となる。

      [![Image from Gyazo](https://i.gyazo.com/0568f9792e447f1821ec6d0a9cd8d66f.gif)](https://gyazo.com/0568f9792e447f1821ec6d0a9cd8d66f)

  - 非公開アクティビティ登録後のユーザー詳細表示画面

    非公開チェック有のアクティビティはアクティビティユーザー本人のユーザー詳細ページからのみアクティビティの確認が可能。

    - ログインユーザーの詳細表示時

      [![Image from Gyazo](https://i.gyazo.com/28337e02fb89a5d429eb40782e8a8574.gif)](https://gyazo.com/28337e02fb89a5d429eb40782e8a8574)

    - ログインユーザー以外の詳細表示時

      [![Image from Gyazo](https://i.gyazo.com/818108a110f4db5e7943c3aef3cb3801.gif)](https://gyazo.com/818108a110f4db5e7943c3aef3cb3801)

## アクティビティ詳細表示

  コース画像、ユーザー名、日付、エリア、距離、タイム、ラップが表示される。

  ログインユーザーのアクティビティであればコース登録（後述）、コメント欄（後述）が表示され、ログインユーザー以外のアクティビティであればコース挑戦（後述）、コメント欄が表示される。

  [![Image from Gyazo](https://i.gyazo.com/417674d39c720edce2ca767b4df944b7.jpg)](https://gyazo.com/417674d39c720edce2ca767b4df944b7)

  - ログインユーザーのアクティビティ詳細表示時

    [![Image from Gyazo](https://i.gyazo.com/8cea9677047c818b21e3666c3e1b02d3.png)](https://gyazo.com/8cea9677047c818b21e3666c3e1b02d3)

  - ログインユーザー以外のアクティビティ詳細表示時

    [![Image from Gyazo](https://i.gyazo.com/c229473b92bd0581d430dd16d9f6b594.png)](https://gyazo.com/c229473b92bd0581d430dd16d9f6b594)

## アクティビティ検索

  性別、年齢、日付、エリア、距離、タイム、ラップの条件で検索できる。非公開チェック有のアクティビティは検索対象外となる。検索結果は10件単位で表示される。

  [![Image from Gyazo](https://i.gyazo.com/86e2d8eb7ec15ad814bbcce512b3fd31.png)](https://gyazo.com/86e2d8eb7ec15ad814bbcce512b3fd31)

  - アクティビティ検索結果表示

    例としてエリアを北海道に絞って検索すると、対象件数が上部に表示される。またログインユーザーのアクティビティがあれば水色で表示される。

    [![Image from Gyazo](https://i.gyazo.com/251a0508022d260f99cbd2d86a5d407f.gif)](https://gyazo.com/251a0508022d260f99cbd2d86a5d407f)

    距離、タイム、ラップは降順、昇順で並べ替えることができる。

    [![Image from Gyazo](https://i.gyazo.com/48f2a011e2a60ffd464cbc804c4fb622.gif)](https://gyazo.com/48f2a011e2a60ffd464cbc804c4fb622)

## ユーザーランキング表示

  総距離順にランキングを表示。年間、月間、週間でタブ分けされている。ログインユーザーの成績は水色で表示される。

  [![Image from Gyazo](https://i.gyazo.com/a0f2202cef77922adc203fdbb901b81a.gif)](https://gyazo.com/a0f2202cef77922adc203fdbb901b81a)

  - 同率順位時の表示

    総距離が同じ場合は同順位として表示され、1〜3位のメダル表示も順位に則して表示される。
    [![Image from Gyazo](https://i.gyazo.com/648d627377e015a991db6e8aa3ecc6d7.jpg)](https://gyazo.com/648d627377e015a991db6e8aa3ecc6d7)
    [![Image from Gyazo](https://i.gyazo.com/bcc0af620084258638901d554a2ccd25.jpg)](https://gyazo.com/bcc0af620084258638901d554a2ccd25)
    [![Image from Gyazo](https://i.gyazo.com/2c4eb77bc7318909f51cfd6517f9498d.png)](https://gyazo.com/2c4eb77bc7318909f51cfd6517f9498d)

## コメント投稿

  - コメント未投稿時

    アクティビティ詳細ページ下部にコメントがない旨が表示される。

    [![Image from Gyazo](https://i.gyazo.com/2578b73d9441fb31b849e0121170110b.png)](https://gyazo.com/2578b73d9441fb31b849e0121170110b)

  - コメント投稿時

    コメント欄に入力し、SENDボタン押下でコメントが表示される。

    [![Image from Gyazo](https://i.gyazo.com/fe865be7a034dddbefab2a72457b6694.gif)](https://gyazo.com/fe865be7a034dddbefab2a72457b6694)

  - 投稿表示レイアウト

    ログインユーザーがコメントユーザーであれば、右側に水色吹き出しで表示され、ログインユーザー以外がコメントユーザーであれば、左側に灰色吹き出しで表示される。

    [![Image from Gyazo](https://i.gyazo.com/7df60cd373a8065193b459eeaa7adc67.jpg)](https://gyazo.com/7df60cd373a8065193b459eeaa7adc67)

    [![Image from Gyazo](https://i.gyazo.com/3e8cf7e5a6a692895278c6cd471965f2.jpg)](https://gyazo.com/3e8cf7e5a6a692895278c6cd471965f2)

## コース登録

  - コース登録前

    - ログインユーザーのアクティビティ詳細表示時

      アクティビティ詳細画面中段にコースを登録するボタンが表示される。

      [![Image from Gyazo](https://i.gyazo.com/86ff5ce1f039cfba1c1699ec5a9a5f19.png)](https://gyazo.com/86ff5ce1f039cfba1c1699ec5a9a5f19)

    - ログインユーザー以外のアクティビティ詳細表示時

      コース登録がされていない旨が表示される。

      [![Image from Gyazo](https://i.gyazo.com/d6b9ddfcd74522067e176cd619f5fa23.png)](https://gyazo.com/d6b9ddfcd74522067e176cd619f5fa23)

  - コース登録

    コースの特徴を入力し、実際にランニングしたコースを登録できる。

    [![Image from Gyazo](https://i.gyazo.com/bfe019b6d4e77aa1503a766d4136adc7.gif)](https://gyazo.com/bfe019b6d4e77aa1503a766d4136adc7)

  - コース登録後

    - ログインユーザーのアクティビティ詳細表示時

      登録したコースの挑戦者数と勝者数が表示され、登録コースの削除ボタンが表示される。

      [![Image from Gyazo](https://i.gyazo.com/e474b859e3489de49f22fb3fedbbdbdd.png)](https://gyazo.com/e474b859e3489de49f22fb3fedbbdbdd)

    - ログインユーザー以外のアクティビティ詳細表示時

      登録したコースの挑戦者数と勝者数が表示され、登録コースの挑戦ボタンが表示される。

      [![Image from Gyazo](https://i.gyazo.com/58928de8e8a48689cff9a6a7c732e143.png)](https://gyazo.com/58928de8e8a48689cff9a6a7c732e143)

## コース挑戦

  登録コース挑戦ようのアクティビティ登録画面が表示され、コース画像、日付、タイムを入力する。距離とエリアは登録されたコースの情報が自動で引き込まれる。挑戦機能はアクティビティの非公開設定が選択不可となる。

  [![Image from Gyazo](https://i.gyazo.com/f15b4f1953c9e60892fbff75bd2abbce.gif)](https://gyazo.com/f15b4f1953c9e60892fbff75bd2abbce)

  - コース挑戦後

    挑戦者数が1人増加する。例としてコース登録元のアクティビティよりも早いタイムで登録認め、勝者数も1人増加する。

    [![Image from Gyazo](https://i.gyazo.com/7e86c1a0e84b31c3f542ecdbce84142d.png)](https://gyazo.com/7e86c1a0e84b31c3f542ecdbce84142d)


# 実装予定の機能
- ユーザー登録
- ユーザー詳細表示
- ユーザー編集
- アクティビティ登録
- アクティビティ表示
- アクティビティ詳細表示
- アクティビティ削除
- アクティビティ検索
- ユーザーランキング表示
- コメント投稿
- コース登録
- コース挑戦
- 非公開設定
- デバイスごとの表示調整
- いいね投稿
- 友達登録


# データベース設計
https://gyazo.com/82b0ce8693e96a868376d08d5d52314d

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

## scoreテーブル

| Column       | Type       | Options                    |
| ------------ | ---------- | -------------------------- |
| distance     | float      | null: false                |
| hour         | integer    | null: false                |
| minute       | integer    | null: false                |
| second       | integer    | null: false                |
| area_id      | integer    | null: false                |
| date         | date       | null: false                |
| time         | integer    | null: false                |
| lap          | integer    | null: false                |
| private      | boolean    |                            |
| user_id      | references | null: false, foreign: true |

### Association

- belongs_to :user
- has_one :course
- has_many :comments

## commentテーブル

| Column   | Type       | Options                    |
| -------- | ---------- | -------------------------- |
| text     | text       | null: false                |
| user_id  | references | null: false, foreign: true |
| score_id | references | null: false, foreign: true |

### Association

- belongs_to :user
- belongs_to :score

## courseテーブル

| Column   | Type       | Options                    |
| -------- | ---------- | -------------------------- |
| feature  | text       |                            |
| user_id  | references | null: false, foreign: true |
| score_id | references | null: false, foreign: true |

### Association

- belongs_to :user
- belongs_to :score

# ローカルでの動作方法
