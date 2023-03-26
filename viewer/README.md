# 要件定義
## 概要
analyzer からのデータをビジュアル化をする view

## フレームワーク
- Vue3
- Nuxt3
- ffmpeg
- Electron
- TypeScript
- Vuetify

## 機能一覧
- [ ] ログイン
  - Microsoft アカウントでのログイン認可エンドポイントへ飛ばす
  - 認可コード をもらう
  - もらった 認可コード をそのまま analyzer に渡す
  - analyzer から Credential をもらう
- [ ] 動画のダウンロード
  - analyzer から .lapsq をもらう
  - .lapsq を解凍してローカルに保存する  
    (ダウンロードボタンも作る → 書き出しではないので注意)
- [ ] ダイジェスト表示
  - 上から下へ, スプリットしたものをそれぞれ, カード的なので表示する
  - Google カレンダーの ”予定” みたいな感じで表示する
  - タイムラインよりかは楽かと
- [ ] タグ機能
  - 取得した lapsq についているタグで検索やグループ化を行えるようにする
  - AIがつけた説明もまあ 検索をかけれるようにする  
    (どちらの表示でもホバーしたら出てくるくらいの priority で) 
- [ ] 動物の説明機能
  - 動物のざっとした写真と説明を表示する  
    (動物をマルチで管理するかもしれない時用)
- [ ] タイムライン表示
  - ローカルにある .lapsq を時系列で並べる
  - 時間軸の拡大縮小機能
- [ ] 動物切り替え
  - もし時間が余ったら, データとUIの追加したい...  


## ログインのフロー

``` mermaid
sequenceDiagram
  autonumber
	participant viewer
	participant analyzer
	participant cloudflare D1
	participant Azure AD
  participant Graph API

	viewer ->> Azure AD : 認証のリクエスト
  Note right of viewer: Auth Request <br /> [redirect]

  loop ユーザーによるログイン
    Azure AD  ->> Azure AD : Microsoftアカウントを使った<br />ユーザーのログイン
  end

  Azure AD -->> viewer: code の発行, リダイレクト
  Note left of Azure AD : Auth Response

  viewer ->>+ analyzer: プリフライトリクエスト (自動)
  analyzer -->>- viewer: OK/200

  viewer ->>+ analyzer: codeを送る
  Note right of viewer: Send Grant Code <br /> [`/api/auth`]

  analyzer ->>+ Graph API: クライアントID, クライアントシークレット, codeを送る
  Note right of analyzer: Tokens Request <br /> (authentication_code)

  Graph API -->>- analyzer: アクセストークン, リフレッシュトークンなどを返す
  Note left of Graph API: Tokens Response

  analyzer ->>+ cloudflare D1: uuidをキーに, デバイスIDや<br />トークンなどを保存
  Note right of analyzer: Tokens Store
  cloudflare D1 -->>- analyzer: OK/200

  analyzer ->>- viewer: Credential を返す
  Note left of analyzer: Credential

  viewer ->> viewer: httpOnly Cookie に <br /> Credential を保存
  Note right of viewer: LocalStore Type
```