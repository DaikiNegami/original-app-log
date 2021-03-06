## アプリケーション名：ろぐ

### アプリケーション概要 
小学校入学までの幼児（4〜6歳）を対象とした、日記投稿Webアプリケーション


### URL 
https://original-app-log.herokuapp.com/

### テスト用アカウント 
メールアドレス：test@test.com<br>
パスワード：test12

### Basic認証
ID：admin<br>
Pass： 2222



### 利用方法
サインインの際に名前とニックネーム、生年月日、親御さんどちらか一方のメールアドレス、パスワードを登録する。ログインの際には、メールアドレスとパスワードを入力。ログイン後、その日にあったことなどの自由な内容を、日記として記録し、投稿することができる。また、文章と同時に、それに関連した絵や写真も投稿することができる。ログインしているユーザーは、他人が投稿した内容についてコメントすることができ、また、自分が投稿した内容のものに関しては編集、投稿の削除をすることができる。
また、ログインしていないユーザーに関しては、投稿、コメント、投稿内容の編集、投稿の削除をすることはできないが投稿された内容のものは閲覧ことができる。



### 目指した課題解決 
2018年度実施のPISA(学習到達度調査)で日本の読解力が前回の8位から15位まで低下した。
そもそも読解力とは、文章を読んでその内容を理解する能力のことを指す。
また文章の意を正しく解する能力であり、その内容について考察し、自分の解釈や考えを言葉で表現することができるといった能力も含まれる。
読解力を高めることは、共感力・表現力・伝達力・コミュニケーション力などの、大人になってからも必要な能力を育むことにもつながる。
以上を踏まえ、小学校入学までの幼児期にあたる子供（4〜6歳）では、まず「言葉に興味を持ち、使ってみること」が重要であると考えた。
自分の言葉で何かを伝えること、そして誰かが発信したことを正確に読み取り、理解することの連続が子供の成長につながり結果的にいかなる文章であっても容易に理解することができる、つまり読解力が向上するのではないかと考えた。



### 要件定義
https://docs.google.com/spreadsheets/d/1r9WY3YNxMt76IZqTUKEUrQpnn-DPIg5XbBXWbsD9uZ8/edit#gid=282075926



### データベース設計 (ER図)
https://gyazo.com/0c1a302dbc0b13cd1bbd8dc566a3d501 



### 実装した機能についてのGIFと説明
#### ・ユーザー管理機能
ユーザー登録では、ニックネーム（公開される名前）、苗字、名前、メールアドレス（親御さんどちらか一方）、パスワード、生年月日を登録。ログインの際には、登録したメールアドレスとパスワードを入力する。ログアウトの際には、ログアウトボタンをクリック。
###### 新規登録 GIF
https://gyazo.com/e42594b40d5e47654f87aad5ea5f1f43<br>
https://gyazo.com/b968e6522041add30b5517f1a3b5086e
###### ログイン　GIF
https://gyazo.com/c1d2b8df1b9807f27717162ac313e712<br>
https://gyazo.com/8d54992a6dee19008061594df1550d1d
###### ログアウト　GIF
https://gyazo.com/26fe5bf4acc6819ea53632b4045c85f3

#### ・日記投稿機能
投稿ボタンから投稿ページに遷移し、記述。正確に記述できればトップページに遷移。記入漏れがあれば、入力画面にリダイレクト。トップページには投稿された日記が上から投稿順に表示。画面上に常に投稿できるようボタンを表示。
###### 日記投稿 GIF
https://gyazo.com/42ccba7c19507d6187e7104d90eda5b1<br>
https://gyazo.com/f7d6c47936ee733cef035e2c75ccd330

#### ・日記詳細機能
トップページ上で投稿された日記をクリックすると、その日記についてのコメントまで確認することができる。
###### ページ遷移 GIF
ログインしている<br>
https://gyazo.com/6a42c5d27b7c5203f0d2a9ec199e6cf0<br>
ログインしていない<br>
https://gyazo.com/e7cae8654663f3c971caef6d75bf4bdc

#### ・日記へのコメント投稿機能
日記詳細ページにてコメントを記述し投稿。正確に記述できれば詳細画面にコメント表示。記入漏れがあれば、詳細画面トップにリダイレクト。
###### コメント投稿GIF
https://gyazo.com/3af8870840dc1825b22015238563f6f3

#### ・マイページ機能
投稿ボタンから投稿ページに遷移し、記述。正確に記述できればトップページに遷移。記入漏れがあれば、入力画面にリダイレクト。トップページには投稿された日記が上から投稿順に表示。画面上に常に投稿できるようボタンを表示。
###### マイページ遷移 GIF
https://gyazo.com/3ddf0fa4cceed959e6a9c1772278705d




### 工夫したポイント
見た目を簡潔にシンプルにすることを心がけた。4〜6歳の子供が利用するものであるため、複雑で選択箇所が多いものであると使用に困ってしまう場合があると考えた。
また、漢字やカタカナでの表記は4〜6歳の子供には難しいと考えたため、全て平仮名での表示になるようにした。
本アプリに関して、削除、編集機能といった基本的な機能は実装しなかった。その理由は、そもそも日記というものの存在意義について、日記はその日に感じたことその日の出来事を残すこと等に意味があるものだと考えているため、削除、編集機能は実装しなかった。



### 実装予定の機能 
日記編集機能




## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |

### Association

- has_many :diaries
- has_many :comments

## diaries テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| user               | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| diary   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :diary


