| 記述すること | 備考 |
| - | - |
| アプリケーション名 | bookdisc |
| アプリケーション概要 | 本についてのツイート、ブログ作成、メッセージのやり取りができ、読書のアウトプット、議論ができる。 |
| URL | https://bookdisc.herokuapp.com/ |
| テスト用アカウント | アカウント<br>・Eメール：test@test<br>・パスワード：test1234<br>Basic認証<br>・ユーザー：oriapp<br>・パスワード：1357 |
| 利用方法 | ・ヘッダーの「アカウント作成」からアカウント作成を行う<br>・ヘッダーの「メニュー」のドロップダウン内の「ツイート新規投稿」、「ブログ新規投稿」、「ルーム作成」からフォームに内容を入力し、それぞれ作成を行う。<br>・ツイート一覧ページ（トップページ）でツイートの一覧が表示され、詳細アイコンからツイート詳細ページに遷移でき、コメントができる。<br>・ツイート詳細ページにはツイートしたユーザー本人であれば、ツイート編集、削除ボタンが表示され、各ボタンから編集、削除が行える。<br>・ヘッダーの「メニュー」のドロップダウン内の「ブログ一覧」からブログ一覧ページに遷移できる。<br>・ブログ一覧ページ内の「Read More」ボタンからブログ詳細ページに遷移し、ブログの内容を見ることができる。<br>・ブログ詳細ページからコメント、いいねができ、投稿者本人であれば、ブログ編集、削除アイコンが表示され、各ボタンから編集、削除が行える。<br>・ヘッダーの「マイメニュー」のドロップダウン内の「マイルーム一覧」から自分の入っているルームの一覧が表示される。<br>・各ルームをクリックするとルーム内のメッセージのやり取りが確認でき、メッセージを送ることができる。 |
| アプリケーションを作成した背景 | 私は読書をするのが趣味だが、周りに読書をする人がおらず、本について話す場がないと感じていた。より多くの読書好きの方とコミニュケーションを取ったり、アウトプットを気軽にできるサービスが欲しいと感じ、このアプリケーションを作成した。 |
| 洗い出した要件 | [要件定義を記載したシート](https://docs.google.com/spreadsheets/d/1Bh3J4-rOjwt-zblmZBulAmzFeZei9AUFX0dPWhaeXDQ/edit#gid=982722306) |
| 実装した機能についての画像やGIFおよびその説明 | 実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。（後日撮影予定） |
| 実装予定の機能 | ブログに本の購入リンクを記載しアフィリエイト機能を追加予定 |
| データベース設計 | [![Image from Gyazo](https://i.gyazo.com/759d06cd3c05f885953263a1bf5d0646.png)](https://gyazo.com/759d06cd3c05f885953263a1bf5d0646) |
| 画面遷移図 | [![Image from Gyazo](https://i.gyazo.com/3d4dfe22b1ead2e9f264dc5d0990f28f.png)](https://gyazo.com/3d4dfe22b1ead2e9f264dc5d0990f28f) |
| 開発環境 | ・フロントエンド：HTML,CSS(BootStrap5) / JavaScript<br>・バックエンド：Ruby(ver 2.6.5) / Ruby on Rails (ver 6.0.0)<br>・インフラ：Heroku , AWS(S3) , MySQL<br>・テスト：RSpec<br>・テキストエディタ：Visual Studio Code<br>・タスク管理：GitHubプロジェクトボード |
| ローカルでの動作方法 | % git clone https://bookdisc.herokuapp.com/bookdisc.git<br>% cd bookdisc<br>% bundle install<br>% yarn install<br>% rails db:create<br>% rails db:migrate<br>% rails s |







